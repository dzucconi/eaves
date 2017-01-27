class CreateUsersAndEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.index :email, unique: true

      t.timestamps
    end

    create_table :emails do |t|
      t.string :from
      t.text :body
      t.string :to
      t.string :subject
      t.string :message_id
      t.index :message_id, unique: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
