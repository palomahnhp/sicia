class User < ApplicationRecord
  rolify
  def full_name
    "Usuario Número #{id}"
  end
end
