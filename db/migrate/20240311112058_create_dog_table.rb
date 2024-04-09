class CreateDogTable < ActiveRecord::Migration[7.1]
  def change
    create_table :dogs do |t|
      t.string :dog_name
      t.date :date_of_birth
    end
  end
end
