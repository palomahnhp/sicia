require 'rails_helper'
require 'devise'

RSpec.describe Devise::PasswordsController, type: :controller do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = create(:user)
  end

  describe "GET #edit" do
    it "returns http 302 when directly access the password change" do
      get :edit
      expect(response).to have_http_status(302)
    end

    it "returns http success when access the password change with parameter password_token" do
      raw  = @user.send_reset_password_instructions

      get :edit , params: {"reset_password_token" => raw}
      expect(response).to have_http_status(:success)
    end
  end
end
