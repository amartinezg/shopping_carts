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

require 'rails_helper'

RSpec.describe CartDetail, type: :model do
  it { should belong_to(:cart) }
  it { should belong_to(:item) }
end
