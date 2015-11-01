class Initial < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :encrypted_password
      t.string :reset_password_token
      t.datetime :reset_password_date
    end

    create_table :access_tokens do |t|
      t.integer :user_id
      t.string :token
      t.string :identifier
      t.timestamps
    end

    add_index :access_tokens, :user_id

  end
end
