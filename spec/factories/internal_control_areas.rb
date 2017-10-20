FactoryGirl.define do
  factory :internal_control_area do
    trading_year Date.today.year
    sequence(:code) { |n| "COD#{n}" }
    sequence(:description) { |n| "Description of area #{n}" }
  end
end
