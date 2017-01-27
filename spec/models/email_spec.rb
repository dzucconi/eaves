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

require 'rails_helper'

RSpec.describe Email, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
