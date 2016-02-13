class QuotesBelongToMarketRents < ActiveRecord::Migration
  def change
    change_table :quotes do |t|
      t.belongs_to :market_rents, index:true
    end
  end
end
