# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  name       :string
#  price      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Item < ApplicationRecord
  #include Imagable
  has_many :cart_details
  has_many :carts, through: :cart_details, dependent: :destroy

  validates_presence_of :name, :price
end
