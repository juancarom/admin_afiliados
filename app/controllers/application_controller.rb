class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, alert: "No tienes permiso para acceder a esta página."
  end
end
