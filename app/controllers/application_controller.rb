class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :prep_menu

  def prep_menu
    @menu = []
    @menu << {label: 'Roles', link: roles_path}
    @menu << {label: 'Users', link: users_path}
    @menu << {label: 'Pets', link: pets_path}
    @menu << {label: 'Appointments', link: appointments_path}
  end
end