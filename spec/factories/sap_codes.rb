FactoryGirl.define do
  factory :sap_code do
    sequence(:code) { |n| "#{n}" }
    sequence(:description) { |n| "Description of code #{n}" }

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
