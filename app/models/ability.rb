class Ability
  include CanCan::Ability
  def initialize(user)
    can :update, Profile, id: user.id
    if user.has_role?(:admin)
      can :manage, :all
    else
      if user.has_role(:visitor)
      end
    end
  end
end
