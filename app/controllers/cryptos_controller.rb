class CryptosController < ApplicationController
  def index
    @cryptos = Crypto.all
  end

  def show
    @crypto = Crypto.find(params[:id])
    @crypto_data = get_crypto_info(@crypto.crypto)
  end

  def new
    @crypto = Crypto.new
  end

  def edit
    @crypto = Crypto.find(params[:id])
  end

  def create
    @crypto = Crypto.new(crypto_params)

    if @crypto.save
      redirect_to @crypto
    else
      render 'new'
    end
  end

  def update
    @crypto = Crypto.find(params[:id])

    if @crypto.update(crypto_params)
      redirect_to @crypto
    else
      render 'update'
    end
  end

  def destroy
    @crypto = Crypto.find(params[:id])
    @crypto.destroy

    redirect_to cryptos_path
  end

  private
    def crypto_params
      params.require(:crypto).permit(:crypto, :amount)
    end

    def get_crypto_info(crypto)
      @coin_market_cap = CoinMarketCap.new("/#{crypto}/", "USD")
      @response = @coin_market_cap.response
    end
    helper_method :get_crypto_info
end