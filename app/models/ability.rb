class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.is_admin?
      can :manage, [Place, Tour]
    else
      can :manage, Review
      can :manage, Comment
    end
  end
end
