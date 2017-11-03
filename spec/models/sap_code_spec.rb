require 'rails_helper'

RSpec.describe SapCode, type: :model do
  describe "#adjudication_way (scope)" do
    it "returns only adjudication_way sap_field" do
      2.times { create :sap_code, :adjudication_way }
      1.times { create :sap_code, :accounting_document }
      expect(SapCode.adjudication_way.size).to be 2
    end
  end

  describe "#accounting_document (scope)" do
    it "returns only accounting_document sap_field" do
      1.times { create :sap_code, :adjudication_way }
      2.times { create :sap_code, :accounting_document }
      expect(SapCode.accounting_document.size).to be 2
    end
  end

  describe "#gexap_task (scope)" do
    it "returns only tramite sap_field" do
      1.times { create :sap_code, :accounting_document }
      2.times { create :sap_code, :gexap_task }
      expect(SapCode.gexap_task.size).to be 2
    end
  end
  describe "#expense_nature (scope)" do
    it "returns only expense_nature sap_field" do
      1.times { create :sap_code, :accounting_document }
      2.times { create :sap_code, :expense_nature }
      expect(SapCode.expense_nature.size).to be 2
    end
  end

end
