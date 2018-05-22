# == Schema Information
#
# Table name: carts
#
#  id            :integer          not null, primary key
#  customer_name :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Cart < ApplicationRecord
  validates_presence_of :customer_name

  has_many :cart_details
  has_many :items, through: :cart_details, dependent: :destroy
  scope :with_items, -> {
    where(id: CartDetail.distinct.pluck(:cart_id))
  }

  def items_raw_query
    query = <<-SQL 
      SELECT 
        items.id,
        items.name,
        items.price
      FROM items
      INNER JOIN cart_details 
        ON items.id = cart_details.item_id
      WHERE cart_details.cart_id = "#{self.id}"
    SQL

    Item.find_by_sql(query)
  end

end
