FactoryGirl.define do
  factory :sap_code do
    sequence(:field) { |n| "Field#{n}" }
    sequence(:code) { |n| n }
    description  "Description of sap code"

    trait :tipo_intervencion do
      field 'ZTIPO_INTERV'
    end

    trait :codigo_modelo do
      field 'CODMOD'
    end

    trait :tramite do
      field 'TRAMITE'
    end

    trait :naturaleza do
      field 'NATURALEZA'
    end

  end
end
