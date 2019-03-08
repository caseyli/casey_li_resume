class DropUsersTable < ActiveRecord::Migration[5.0]
  def up
    drop_table :users
  end

  def down
    create_table :users do |t|
      t.string :email
      t.string :encrypted_password
      t.string :salt

      t.timestamps
    end
  end
end
