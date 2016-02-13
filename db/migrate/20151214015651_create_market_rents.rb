class CreateMarketRents < ActiveRecord::Migration
  def change
    create_table :market_rents do |t|
      t.string :key
      t.string :neighborhood
      t.integer :market_rent

      t.timestamps null: false
    end
  end
end
