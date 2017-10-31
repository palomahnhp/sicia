require 'rails_helper'

RSpec.describe Proposal, type: :model do

  describe "#Proposal (common validations)" do
    let(:proposals) { build(:proposals) }

    it "is valid with a valid trading year " do
      proposal.trading_year = 2017
      expect(proposal).to be_valid
    end
    it "isn't valid without trading year" do
      proposal.trading_year = nil
      expect(proposal).to be_invalid
    end
    it "isn't valid with trading year not in limits" do
      proposal.trading_year = 210
      expect(proposal).to be_invalid
    end
    it "is valid with a file_number" do
      proposal.file_number = '300/2017/123456'
      expect(proposal).to be_valid
    end
    it "isn't valid without file_number" do
      proposal.file_number = nil
      expect(proposal).to be_invalid
    end
    it "is valid with a manager_body" do
      proposal.manager_body = '001010'
      expect(proposal).to be_valid
    end
    it "isn't valid without manager_body" do
      proposal.manager_body = nil
      expect(proposal).to be_invalid
    end
    it "is valid with a approval_body" do
      proposal.approval_body = '01'
      expect(proposal).to be_valid
    end
    it "isn't valid without approval_body" do
      proposal.approval_body = nil
      expect(proposal).to be_invalid
    end
    it "is valid with a title" do
      proposal.title = 'Titulo de la propuesta'
      expect(proposal).to be_valid
    end
    it "isn't valid without approval_body" do
      proposal.title = nil
      expect(proposal).to be_invalid
    end
    it "is valid with a valid amount" do
      proposal.approval_body = 9999,99
      expect(proposal).to be_valid
    end
    it "isn't valid without amount" do
      proposal.amount = nil
      expect(proposal).to be_invalid
    end
    it "isn't valid without a valid amount" do
      proposal.amount = 'asa'
      expect(proposal).to be_invalid
    end

  end

  describe "#SAP Proposal  ( validations)" do
    let(:proposals) { build(:proposals, :sap_proposal) }

    it "is valid automatic_proposal with a sap_proposal, internal_control type, accounting_document ..." do
      expect(proposal).to be_valid
    end

    it "isn't valid without a accounting_document " do
      proposal.accounting_document = nil

      expect(proposal).to be_invalid
    end

    it "isn't valid without a aci file type" do
      proposal.internal_control_file = nil
      expect(proposal).to be_invalid
    end

    it "isn't valid without a aci procedure type" do
      proposal.internal_control_procedure = nil

      expect(proposal).to be_invalid
    end

    it "isn't valid without a aci action type" do
      proposal.internal_control_action = nil

      expect(proposal).to be_invalid
    end
  end
end