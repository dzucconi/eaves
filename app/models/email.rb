# == Schema Information
#
# Table name: emails
#
#  id         :integer          not null, primary key
#  message_id :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Email < ApplicationRecord
  belongs_to :user

  validates :message_id, presence: true, uniqueness: true

  def reader
    @reader ||= EmailReader.new(message_id)
  end
end
