FactoryGirl.define do
  factory :requeriment do
    trading_year Date.today.year
    sequence(:code, 1, 9999 ) { |n| n }
    sequence(:description) { |n| "Description of area #{n}" }
    kind 'RB'
    updated_by 'FACTORY'
    non_observance_level false
    discrepancy_allowed true

    trait :basic_req do
      kind 'RB'
      non_observance_level false
      discrepancy_allowed true
    end

    trait :permanent_control do
      kind 'CP'
      non_observance_level true
      discrepancy_allowed  false
    end

    trait :document do
      kind 'DOC'
      non_observance_level false
      discrepancy_allowed  true
    end
  end
end
