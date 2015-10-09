class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, limit: 35
      t.string :address
      t.string :city
      t.string :state, limit: 20
      t.integer :zip, limit: 5
      t.string :school
      t.integer :years_in_practice, limit: 3

      t.timestamps null: false
    end
  end
end
