require 'rails_helper'

RSpec.describe IcFile, type: :model do
  describe "#Area (validations)" do
    let(:file) { build(:ic_file) }

    it " is valid with a valid trading year " do
      file.trading_year = 2017
      expect(file).to be_valid
    end
    it " isn't valid without trading year" do
      file.trading_year = nil
      expect(file).to be_invalid
    end
    it " isn't valid with trading year not in limits" do
      file.trading_year = 210
      expect(file).to be_invalid
    end

    it " is valid with a valid code" do
      file.code = 'CODE'
      expect(file).to be_valid
    end
    it " is invalid without code" do
      file.code = nil
      expect(file).to be_invalid
    end
    it " is invalid with short code" do
      file.code = 'COD'
      expect(file).to be_invalid
    end
    it " is invalid with long code" do
      file.code = 'CODELONG'
      expect(file).to be_invalid
    end

    it " has a valid description" do
      file.description = 'Description of area'
      expect(file).to be_valid
    end
    it " is invalid without description" do
      file.description = nil
      expect(file).to be_invalid
    end
  end
end
