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

require 'rails_helper'

RSpec.describe Email, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
