# == Schema Information
#
# Table name: carts
#
#  id            :integer          not null, primary key
#  customer_name :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe Cart, type: :model do
  it { should have_many(:items).dependent(:destroy) }
  it { should validate_presence_of(:customer_name) }
end
