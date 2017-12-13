require 'rails_helper'

describe User do

    describe "attributes added to devise" do
      let(:user) { create(:user) }

      it "first_surname" do
        user = create(:user, first_surname: "Paloma")
        expect(user.first_surname).to eq("Paloma")
      end
      it { should respond_to(:name) }
      it { should respond_to(:second_surname) }
      it { should respond_to(:document_number) }
      it { should respond_to(:document_type) }
      it { should respond_to(:pernr) }
      it { should respond_to(:ayre) }
      it { should respond_to(:uweb_id) }
      it { should respond_to(:email) }
      it { should respond_to(:full_name) }
    end
end

