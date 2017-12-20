FactoryGirl.define do
  factory :approval_body do
    trading_year Date.today.year
    sequence(:code, 1, 99 ) { |n| n }
    description  "Approval body #{:code}"
  end
end
