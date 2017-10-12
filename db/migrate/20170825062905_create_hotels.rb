class CreateHotels < ActiveRecord::Migration[5.1]
  def change
    create_table :hotels do |t|
      t.integer :user_id_to_manage
      t.string :image
      t.string :name, null: false
      t.text   :summary
      t.string :hotel_url
      t.string :street_address
      t.string :phone_number
      t.integer :access_count, default: 0

      t.timestamps
    end
  end
end
