require 'rails_helper'

RSpec.describe IcAction, type: :model do
  describe "#Action (validations)" do
    let(:action) { build(:internal_control_action) }

    it " is valid with a valid trading year " do
      action.trading_year = 2017
      expect(action).to be_valid
    end
    it " isn't valid without trading year" do
      action.trading_year = nil
      expect(action).to be_invalid
    end
    it " isn't valid with trading year not in limits" do
      action.trading_year = 210
      expect(action).to be_invalid
    end

    it " is valid with a valid code" do
      action.code = '12'
      expect(action).to be_valid
    end
    it " is invalid without code" do
      action.code = nil
      expect(action).to be_invalid
    end
    it " is invalid with no numerical code" do
      action.code = 'CO'
      expect(action).to be_invalid
    end
    it " is invalid with long code" do
      action.code = '123'
      expect(action).to be_invalid
    end

    it " has a valid description" do
      action.description = 'Description of Action'
      expect(action).to be_valid
    end
    it " is invalid without description" do
      action.description = nil
      expect(action).to be_invalid
    end
  end
end
