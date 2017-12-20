FactoryGirl.define do
  factory :manager_body do
    trading_year Date.today.year
    sequence(:code, 1, 99 ) { |n| n }
    description  "Manager body #{:code}"
  end
end
