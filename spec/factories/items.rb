FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    price { Faker::Number.decimal(2, 2) }
  end
end