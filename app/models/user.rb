class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
    "#{self.name} #{self.first_surname} #{self.second_surname}"
  end

  def full_name_ayre
    "#{self.ayre} - #{full_name}"
  end
end
