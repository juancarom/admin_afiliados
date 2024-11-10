class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { user: 'user', admin: 'admin' }

  # Método para verificar si el usuario es administrador
  def admin?
    role == 'admin'
  end
end
