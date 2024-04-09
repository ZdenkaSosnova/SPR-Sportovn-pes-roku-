class AddMemberToOwners < ActiveRecord::Migration[7.1]
  def change
    add_reference :owners, :member, null: false, foreign_key: true
  end
end
