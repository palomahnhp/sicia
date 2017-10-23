require 'rails_helper'

RSpec.describe SapCode, type: :model do
  describe "#tipo_intervencion (scope)" do
    it "returns only tipo_intervencion fields" do
      2.times { create :sap_code, :tipo_intervencion }
      1.times { create :sap_code, :codigo_modelo }
      expect(SapCode.tipo_intervencion.size).to be 2
    end
  end

  describe "#codigo_modelo (scope)" do
    it "returns only codigo_modelo fields" do
      1.times { create :sap_code, :tipo_intervencion }
      2.times { create :sap_code, :codigo_modelo }
      expect(SapCode.codigo_modelo.size).to be 2
    end
  end

  describe "#tramite (scope)" do
    it "returns only tramite fields" do
      1.times { create :sap_code, :codigo_modelo }
      2.times { create :sap_code, :tramite }
      expect(SapCode.tramite.size).to be 2
    end
  end
  describe "#naturaleza (scope)" do
    it "returns only naturaleza fields" do
      1.times { create :sap_code, :codigo_modelo }
      2.times { create :sap_code, :naturaleza }
      expect(SapCode.naturaleza.size).to be 2
    end
  end

end
