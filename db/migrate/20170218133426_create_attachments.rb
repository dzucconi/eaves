class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
      t.string :file_name
      t.integer :file_size
      t.string :content_type
      t.references :email, foreign_key: true

      t.timestamps
    end
  end
end
