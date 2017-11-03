FactoryGirl.define do
  factory :sap_code do
    sequence(:sap_field) { |n| "Field#{n}" }
    sequence(:code) { |n| n }
    description  "Description of sap code"

    trait :adjudication_way do
      sap_field 'FORMA_ADJUD'
    end

    trait :accounting_document do
      sap_field 'CODMOD'
    end

    trait :gexap_task do
      sap_field 'TRAMITE'
    end

    trait :expense_nature do
      sap_field 'NATURALEZA'
    end

  end
end
