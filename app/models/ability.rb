class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Usuario sin sesión
    if user.admin?
      can :manage, :all
    else
      can :read, :dashboard
      can :access, :rails_admin
      cannot :manage, :all
    end
  end
end
