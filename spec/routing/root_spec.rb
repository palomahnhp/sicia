require 'rails_helper'

describe "Root for app" do
  it "default" do
    expect(get: "/").to route_to(:controller => "proposals", "action"=>"index")
  end

  it "welcome" do
    expect(get: welcome_index_path ).to route_to(:controller => "welcome", "action"=>"index")
  end
end
