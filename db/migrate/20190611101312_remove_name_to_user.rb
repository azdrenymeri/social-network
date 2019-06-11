class RemoveNameToUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :bio, :string
    remove_column :users, :name, :string
    remove_column :users, :photo, :string
  end
end
