class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { user: 'user', admin: 'admin' }

  # Método para verificar si el usuario es administrador
  def admin?
    role == 'admin'
  end
  def to_s
    email
  end

  # Método para personalizar la etiqueta de los usuarios en RailsAdmin
  # para el modelo User
  def custom_label_method
    "#{email} (#{role})"
  end
end
