class AddBioToUsers < ActiveRecord::Migration[5.2]
  def change
    remove :users, :fieldname, :string
  end
end
