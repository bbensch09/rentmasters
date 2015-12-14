class AddBedroomsToMarketRents < ActiveRecord::Migration
  def change
    change_table :market_rents do |t|
      add_column :market_rents, :bedrooms, :string
    end
  end
end
