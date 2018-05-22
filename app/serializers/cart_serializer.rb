class CartSerializer
  include FastJsonapi::ObjectSerializer
  attributes :customer_name
  attribute :items do |cart|
    ItemSerializer.new(cart.items_raw_query).serializable_hash
  end
end
