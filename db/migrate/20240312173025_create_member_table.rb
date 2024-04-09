class CreateMemberTable < ActiveRecord::Migration[7.1]
  def change
    create_table :members do |t|
      t.string :title
      t.string :last_name
      t.string :first_name
      t.string :city
      t.string :email
      t.string :external_id
    end
  end
end
