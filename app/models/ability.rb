class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.is_admin?
      can :manage, [Place, Tour, Booking]
    else
      can :manage, Review
      can :manage, Comment
      can :create, Booking
      can :manage, Like
    end
  end
end
