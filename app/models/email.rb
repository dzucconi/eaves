require 'mail'
# == Schema Information
#
# Table name: emails
#
#  id                :integer          not null, primary key
#  message_id        :string
#  user_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  document          :text
#  remote_message_id :string
#  in_reply_to       :string
#  to                :string           default("{}"), is an Array
#  from              :string           default("{}"), is an Array
#  subject           :string
#  date              :datetime
#  message           :text
#

class Email < ApplicationRecord
  belongs_to :user

  validates :remote_message_id, presence: true, uniqueness: true
  validates :message_id, presence: true, uniqueness: true

  def to_s
    message_id
  end

  def parsed
    @parsed ||= Mail.read_from_string(document)
  end

  def body
    decoded = if parsed.multipart?
      parsed.text_part.body.decoded
    else
      parsed.body.decoded
    end

    reply = EmailReplyParser.parse_reply decoded

    MailExtract.parse reply
  end

  def recipients
    to.map { |email| User.find_by(email: email) }.compact
  end
end
