require 'rails_helper'

feature "User access",:type => :feature do
  it "sign_up" do
    user = build(:user)
    sign_up_with(user.email, user.password, user.password)
    expect(page).to have_text("Te has registrado correctamente")
  end

  it "sign_up with user already created" do
    user = create(:user)
    sign_up_with(user.email, user.password, user.password)
    expect(page).to have_text("ya está en uso")
  end

  it "sign_in without sign_up" do
    user = build(:user)
    signin(user, user.password)
    expect(page).to have_text("Email o contraseña inválidos")
  end

  it "wrong password sign_in" do
    user = create(:user)
    signin(user, "wrong_password")
    expect(page).to have_text("Email o contraseña inválidos")
  end
end
