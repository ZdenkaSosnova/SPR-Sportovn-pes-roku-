class AdDogToHerdings < ActiveRecord::Migration[7.1]
  def change
    add_reference :herdings, :dog, null: false, foreign_key: true
  end
end
