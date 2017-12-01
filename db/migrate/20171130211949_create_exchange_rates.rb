class CreateExchangeRates < ActiveRecord::Migration[5.0]
  def change
    create_table :exchange_rates do |t|
      t.decimal :value
      t.decimal :nominal, default: 1.0
      t.datetime :datetime

      t.timestamps
    end
  end
end
