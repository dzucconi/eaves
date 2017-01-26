class CreateUsersAndEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email

      t.timestamps
    end

    create_table :emails do |t|
      t.string :from
      t.text :body
      t.string :to
      t.string :subject
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
