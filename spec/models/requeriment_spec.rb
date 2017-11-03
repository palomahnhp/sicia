require 'rails_helper'

RSpec.describe Requeriment, type: :model do

  describe "#requeriment (scope)" do
    it "returns only recs with kind RB" do
      2.times { create :requeriment, :basic_req }
      1.times { create :requeriment, :permanent_control }
      expect(Requeriment.basic_req.size).to be 2
    end
    it "returns only recs with kind PC" do
      2.times { create :requeriment, :permanent_control }
      1.times { create :requeriment, :basic_req }
      expect(Requeriment.permanent_control.size).to be 2
    end
    it "returns only recs with kind DOC" do
      2.times { create :requeriment, :document }
      1.times { create :requeriment, :basic_req }
      expect(Requeriment.document.size).to be 2
    end
  end

  describe "#requeriment (validations)" do
    let(:requeriment) { build(:requeriment) }

    it " is valid with a valid trading year" do
      requeriment.trading_year = 2017
      expect(requeriment).to be_valid
    end

    it " is invalid with a not valid trading year" do
      requeriment.trading_year = 201
      expect(requeriment).to be_invalid
    end

    it " is invalid without trading year" do
      requeriment.trading_year = nil
      expect(requeriment).to be_invalid
    end

    it " is valid with a valid kind " do
      requeriment.kind = 'RB'
      expect(requeriment).to be_valid
    end

    it " is invalid with a invalid kind " do
      requeriment.kind = 'XX'
      expect(requeriment).to be_invalid
    end

    it " is valid with a valid code" do
      requeriment.code = 125
      expect(requeriment).to be_valid
    end

    it " is invalid with a invalid code" do
      requeriment.code = 'code'
      expect(requeriment).to be_invalid
    end

    it " is invalid without a code" do
      requeriment.code = nil
      expect(requeriment).to be_invalid
    end

    it "is valid with a description" do
      requeriment.description = 'Requeriment description'
      expect(requeriment).to be_valid
    end

    it "is invalid without a description" do
      requeriment.description = nil
      expect(requeriment).to be_invalid
    end

  end

end
