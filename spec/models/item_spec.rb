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

require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should have_many(:carts).dependent(:destroy) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:price) }
end
