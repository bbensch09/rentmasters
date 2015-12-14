class AddNameEmailNeighborhoodEtcToQuotes < ActiveRecord::Migration
  def change
    change_table :quotes do |item|
      add_column :quotes, :first_name, :string
      add_column :quotes, :last_name, :string
      add_column :quotes, :email, :string
      add_column :quotes, :neighborhood, :string
      add_column :quotes, :num_bedrooms, :integer
      add_column :quotes, :bathrooms, :string
      add_column :quotes, :condition, :string
      add_column :quotes, :current_rent, :integer
    end
  end
end
