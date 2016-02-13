class NumBedsToString < ActiveRecord::Migration
  def change
    change_table :quotes do |t|
      t.remove :num_bedrooms
      add_column :quotes, :bedrooms, :string
    end
  end
end
