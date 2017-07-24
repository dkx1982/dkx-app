# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  total      :integer          default(0)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Order < ApplicationRecord
  before_create :dkx_token
  belongs_to :user
  has_many :product_lists

  def dkx_token
    self.token = SecureRandom.uuid
  end
end
