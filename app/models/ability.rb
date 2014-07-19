class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role?(:free)
      if user.has_role?(:premium)
      end
    end
    if user.has_role?(:publisher)
      if user.has_role?(:admin)
        can :manage, :all
      end
    end
  end
end
