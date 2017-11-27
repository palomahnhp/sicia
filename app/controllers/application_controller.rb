class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include PublicActivity::StoreController
  protect_from_forgery with: :exception


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :current_password, :ayre, :uweb_id, :name, :first_surname,
                                                       :second_surname, :document_number, :document_type, :pernr, :phone, :official_position])
  end
end
