require 'rails_helper'

RSpec.describe InternalControlProcedure, type: :model do
  describe "#Procedure (validations)" do
    let(:procedure) { build(:internal_control_procedure) }

    it " is valid with a valid trading year " do
      procedure.trading_year = 2017
      expect(procedure).to be_valid
    end
    it " isn't valid without trading year" do
      procedure.trading_year = nil
      expect(procedure).to be_invalid
    end
    it " isn't valid with trading year not in limits" do
      procedure.trading_year = 210
      expect(procedure).to be_invalid
    end

    it " is valid with a valid code" do
      procedure.code = '12'
      expect(procedure).to be_valid
    end
    it " is invalid without code" do
      procedure.code = nil
      expect(procedure).to be_invalid
    end
    it " is invalid with no numerical code" do
      procedure.code = 'CO'
      expect(procedure).to be_invalid
    end
    it " is invalid with long code" do
      procedure.code = '123'
      expect(procedure).to be_invalid
    end

    it " has a valid description" do
      procedure.description = 'Description of Procedure'
      expect(procedure).to be_valid
    end
    it " is invalid without description" do
      procedure.description = nil
      expect(procedure).to be_invalid
    end
  end
end
