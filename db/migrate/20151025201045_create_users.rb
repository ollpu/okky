class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_salt
      t.string :password_hash
      t.string :name
      t.integer :privileges
      t.timestamps null: false
    end
  end
end
