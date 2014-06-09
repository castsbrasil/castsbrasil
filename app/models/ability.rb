class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_free?
      if user.is_premium?
      end
    end
    if user.is_publisher?
      if user.is_admin?
        can :manage, :all
      end
    end
  end
end
