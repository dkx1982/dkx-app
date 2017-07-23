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
  belongs_to :user
  has_many :product_lists
end
