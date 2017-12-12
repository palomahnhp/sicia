class IcActionRequeriment < ActiveRecord::Base
  belongs_to :ic_action
  belongs_to :requeriment
end