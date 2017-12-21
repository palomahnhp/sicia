FactoryGirl.define do
  factory :society do
    sequence(:code, 1, 99 ) { |n| n }
    description  "Society"
  end
end
