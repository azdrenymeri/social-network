class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.date :DOB
      t.string :relationship
      t.string :email
      t.string :password_digest
      t.binary :picture

      t.timestamps
    end
  end
end
