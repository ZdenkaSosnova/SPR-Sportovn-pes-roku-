class AddOwnerIdToDogs < ActiveRecord::Migration[7.1]
  def change
    add_reference :dogs, :owner, null: false, foreign_key: true
  end
end
