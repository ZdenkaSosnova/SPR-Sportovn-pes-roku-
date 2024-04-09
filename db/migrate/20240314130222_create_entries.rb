class CreateEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :herdings do |t|
      t.string :category
      t.integer :points
      t.integer :position
      t.integer :num_dogs
      t.integer :final_points
      t.string :event_place
      t.date :event_date
      t.timestamps
    end
  end
end
