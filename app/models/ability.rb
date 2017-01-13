class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.is_admin?
      can :manage, Place
    else
      can :manage, Review
      can [:read, :create], Comment
    end
  end
end
