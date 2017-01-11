class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :name
      t.string :phone
      t.string :address
      t.boolean :is_admin, default: false
      t.timestamps null: false
    end

    add_index :users, :email, unique: true
  end
end
