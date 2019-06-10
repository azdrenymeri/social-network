class RemoveBioToUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :fieldname, :string
  end
end
