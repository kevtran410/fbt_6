class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.is_admin?
      can :manage, Place
    else
      can [:read, :create], Review
    end
  end
end
