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

require 'rails_helper'

RSpec.describe Attachment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
