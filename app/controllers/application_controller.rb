class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end

  # before_action :authenticate_user!
  before_action :authenticate_all_except_home

  def authenticate_all_except_home
    authenticate_user! unless (controller_name == 'Home')
  end

  before_action :prep_menu

  def prep_menu
    @menu = []
    @menu << {label: 'Home', link: root_path}
    @menu << {label: 'Roles', link: roles_path}
    @menu << {label: 'Users', link: users_path}
    @menu << {label: 'Rights', link: rights_path}
    @menu << {label: 'Pets', link: pets_path}
    @menu << {label: 'Appointments', link: appointments_path}
  end
end