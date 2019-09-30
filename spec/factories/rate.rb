FactoryBot.define do
  factory :rate do
    value { Faker::Number.decimal(l_digits: 2, r_digits: 4) }
    end_date { nil }
  end
end
