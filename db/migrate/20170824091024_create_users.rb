class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :first_name, null: false, default: "太郎"
      t.string :last_name, null: false, default: "山田"
      t.integer :sex, null: false, default: 0
      t.datetime :birthday, null: false, default: Time.now
      t.integer :authority, null: false, default: 0

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
  end
end
