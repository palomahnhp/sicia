require 'rails_helper'

RSpec.describe Setting, type: :model do
  describe Setting do
    before do
      Setting["org_name"] = 'My organization'
    end

    it "return the overriden setting" do
      expect(Setting['org_name']).to eq('My organization')
    end

    it "should return nil" do
      expect(Setting['undefined_key']).to eq(nil)
    end

    it "should persist a setting on the db" do
      expect(Setting.where(key: 'org_name', value: 'My organization')).to exist
    end
  end

 end
