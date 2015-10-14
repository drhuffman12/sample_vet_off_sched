class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :pet, index: true, foreign_key: true
      t.datetime :date_of_visit
      t.boolean :reminder
      t.string :reason

      t.timestamps null: false
    end
  end
end
