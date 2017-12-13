require 'rails_helper'

describe "Password" do
  describe "GET /password_changes" do
    it "does not allow direct access without reset_password_token" do
      get edit_user_password_path
      expect(response.status).to eq(302)
    end
  end
end

