# == Schema Information
#
# Table name: cart_details
#
#  id         :integer          not null, primary key
#  cart_id    :integer
#  item_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CartDetail < ApplicationRecord
  belongs_to :cart
  belongs_to :item

  validates_presence_of :cart_id, :item_id
end
