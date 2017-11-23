class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
    name = self.name.nil? ? '' : self.name
    surname = self.first_surname.nil? ? '' : self.first_surname
    second_surname = self.second_surname.nil? ? '' : self.second_surname

    name + ' ' + surname + ' ' + second_surname
  end
end
