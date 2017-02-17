# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#

class User < ApplicationRecord
  has_many :emails, dependent: :destroy

  validates :email, presence: true, uniqueness: true

  def to_s
    "#{name} &lt;#{email}&gt;".html_safe
  end
end
