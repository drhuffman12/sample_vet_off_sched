class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :name, limit: 35
      t.string :pet_type
      t.string :breed, limit: 35
      t.integer :age
      t.integer :weight

      t.timestamps null: false
    end
  end
end
