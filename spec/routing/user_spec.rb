require 'rails_helper'

describe "Root for user" do
  it "sign_in" do
    expect(get: new_user_session_path ).to route_to(:controller => "devise/sessions", "action"=>"new")
    expect(post: new_user_session_path ).to route_to(:controller => "devise/sessions", "action"=>"create")
  end

  it "sign_out" do
    expect(delete: destroy_user_session_path ).to route_to(:controller => "devise/sessions", "action"=>"destroy")
  end

  it "sign_up" do
    expect(get: new_user_registration_path ).to route_to(:controller => "devise/registrations", "action"=>"new")
    expect(post: user_registration_path ).to route_to(:controller => "devise/registrations", "action"=>"create")
  end
end

describe "Password" do
  it "forgot" do
    expect(get: new_user_password_path ).to route_to(:controller => "devise/passwords", "action"=>"new")
  end

  it "change" do
    expect(get: edit_user_password_path ).to route_to(:controller => "devise/passwords", "action"=>"edit")
  end

  it "update" do
    expect(patch: user_password_path ).to route_to(:controller => "devise/passwords", "action"=>"update")
    expect(put: user_password_path ).to route_to(:controller => "devise/passwords", "action"=>"update")
    expect(post: user_password_path ).to route_to(:controller => "devise/passwords", "action"=>"create")
  end
end

describe "Registered user" do
  it "edit" do
    expect(get: edit_user_registration_path ).to route_to(:controller => "devise/registrations", "action"=>"edit")
  end

  it "update" do
    expect(put: user_registration_path ).to route_to(:controller => "devise/registrations", "action"=>"update")
    expect(patch: user_registration_path ).to route_to(:controller => "devise/registrations", "action"=>"update")
  end

  it "delete" do
    expect(delete: user_registration_path ).to route_to(:controller => "devise/registrations", "action"=>"destroy")
  end
end

