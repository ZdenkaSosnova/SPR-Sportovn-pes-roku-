class AddPasswordOwner < ActiveRecord::Migration[7.1]
  def change
    add_column :owners, :password_digest, :string
  end
end
