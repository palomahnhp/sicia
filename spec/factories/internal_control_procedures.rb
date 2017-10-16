FactoryGirl.define do
  factory :internal_control_procedure do
    trading_year Date.today.year
    sequence(:code, 1, 99 ) { |n| n }
    description "Description of procedure"
    association :internal_control_area
  end
end
