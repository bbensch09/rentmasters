class RentsStringToFloat < ActiveRecord::Migration
  def change
    change_table :market_rents do |t|
      t.remove :market_rent
      add_column :market_rents, :market_rent, :float
    end
  end
end
