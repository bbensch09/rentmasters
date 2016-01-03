class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :email, null: false 
    	t.string :password_digest
      t.timestamps null: false
    end
    change_table :quotes do |t|
    	t.belongs_to :user, index: true
    end
  end
end
