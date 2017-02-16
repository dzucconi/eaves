class AddMoreAttributesToEmails < ActiveRecord::Migration[5.0]
  def change
    add_column :emails, :document, :text

    add_column :emails, :remote_message_id, :string
    add_index :emails, :remote_message_id, unique: true

    add_column :emails, :in_reply_to, :string
    add_column :emails, :to, :string, array: true, default: []
    add_column :emails, :from, :string, array: true, default: []
    add_column :emails, :subject, :string
    add_column :emails, :date, :datetime

    add_column :emails, :message, :text
  end
end
