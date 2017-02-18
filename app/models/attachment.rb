# == Schema Information
#
# Table name: attachments
#
#  id           :integer          not null, primary key
#  file_name    :string
#  file_size    :integer
#  content_type :string
#  email_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Attachment < ApplicationRecord
  belongs_to :email

  validates :file_name, presence: true
  validates :file_size, presence: true
  validates :content_type, presence: true
  validates :email_id, presence: true

  before_destroy :remove_s3_object

  def signed
    AttachmentPersister.bucket.object(key)
      .presigned_url(:put, acl: 'public-read')
  end

  def extension
    File.extname(file_name)
  end

  def key
    "#{email.id}/#{id}/#{File.basename(file_name, extension).parameterize}#{extension}"
  end

  def qualified
    "https://#{AttachmentPersister::BUCKET}.s3.amazonaws.com/#{key}"
  end

  def remove_s3_object
    AttachmentPersister.destroy(key)
  end
end
