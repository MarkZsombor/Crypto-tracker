class CreateCryptos < ActiveRecord::Migration[5.1]
  def change
    create_table :cryptos do |t|
      t.string :crypto
      t.decimal :amount

      t.timestamps
    end
  end
end
