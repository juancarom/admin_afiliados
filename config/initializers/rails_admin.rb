RailsAdmin.config do |config|
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  # Autorizar con cancancan
  config.authorize_with :cancan

  # Redirigir usuarios no autorizados
  config.parent_controller = 'ApplicationController'
end
