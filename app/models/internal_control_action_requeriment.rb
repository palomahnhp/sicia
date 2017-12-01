class InternalControlActionRequeriment < ActiveRecord::Base
  belongs_to :internal_control_action
  belongs_to :requeriment
end