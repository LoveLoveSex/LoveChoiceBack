class CreateHotelServices < ActiveRecord::Migration[5.1]
  def change
    create_table :hotel_services do |t|
      t.integer :hotel_id, null: false
      t.string :name, null: false
      t.string :day_of_the_week
      t.integer :money, null: false
      t.integer :category, null: false, default: 0

      t.timestamps
    end
  end
end
