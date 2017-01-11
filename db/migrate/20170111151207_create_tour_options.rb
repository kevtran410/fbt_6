class CreateTourOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :tour_options do |t|
      t.references :tour, foreign_key: true
      t.date :start_date
      t.integer :person_quantity
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
