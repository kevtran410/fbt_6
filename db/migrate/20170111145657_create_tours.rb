class CreateTours < ActiveRecord::Migration[5.0]
  def change
    create_table :tours do |t|
      t.string :name
      t.integer :duration
      t.float :price
      t.float :rating
      t.text :content
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
