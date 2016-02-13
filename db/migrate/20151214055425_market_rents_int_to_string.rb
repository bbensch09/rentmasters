class MarketRentsIntToString < ActiveRecord::Migration
  def change
    change_column :market_rents, :market_rent, :string
  end
end
