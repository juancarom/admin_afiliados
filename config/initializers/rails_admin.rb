RailsAdmin.config do |config|
  config.asset_source = :importmap
  config.main_app_name = ["Sistema de Afiliados"]

  # I18n.default_locale = :es
  # Autenticación con Devise
  config.authenticate_with do
    # Redirige al inicio de sesión si no hay un usuario autenticado
    if !current_user
      redirect_to main_app.new_user_session_path, alert: 'Por favor, inicia sesión para acceder a la administración.'
    end
  end
  config.current_user_method(&:current_user)

  # Autorización con Cancancan o validación manual de rol
  config.authorize_with do |controller|
    if controller.current_user && controller.current_user.admin?
      true
    else
      controller.redirect_to main_app.root_path, alert: 'No tienes permiso para acceder a esta página.'
    end
  end

  config.model 'User' do
    object_label_method do
      :custom_label_method
    end
  end
end
