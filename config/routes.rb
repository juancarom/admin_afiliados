Rails.application.routes.draw do
  # Rutas para la autenticación de Devise (sin controladores personalizados)
  devise_for :users

  # Montar RailsAdmin en la ruta /admin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # Ruta raíz de la aplicación
  root "index#index"
end
