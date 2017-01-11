class CreateTourPlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :tour_places do |t|
      t.references :tour, foreign_key: true
      t.references :place, foreign_key: true
      t.integer :position
      t.timestamps
    end
  end
end
