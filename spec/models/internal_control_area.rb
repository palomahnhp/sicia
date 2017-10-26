require 'rails_helper'

RSpec.describe InternalControlFile, type: :model do
  describe "#Area (validations)" do
    let(:area) { build(:internal_control_area) }

    it " is valid with a valid trading year " do
      area.trading_year = 2017
      expect(area).to be_valid
    end
    it " isn't valid without trading year" do
      area.trading_year = nil
      expect(area).to be_invalid
    end
    it " isn't valid with trading year not in limits" do
      area.trading_year = 210
      expect(area).to be_invalid
    end

    it " is valid with a valid code" do
      area.code = 'CODE'
      expect(area).to be_valid
    end
    it " is invalid without code" do
      area.code = nil
      expect(area).to be_invalid
    end
    it " is invalid with short code" do
      area.code = 'COD'
      expect(area).to be_invalid
    end
    it " is invalid with long code" do
      area.code = 'CODELONG'
      expect(area).to be_invalid
    end

    it " has a valid description" do
      area.description = 'Description of area'
      expect(area).to be_valid
    end
    it " is invalid without description" do
      area.description = nil
      expect(area).to be_invalid
    end
  end
end
