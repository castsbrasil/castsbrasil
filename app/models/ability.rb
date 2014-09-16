class Ability
  include CanCan::Ability
  def initialize(user)
    can :update, Profile, id: user.id
    if user.has_role?(:admin)
      can :manage, :all
    else
      if user.level != Level.find(1)
      end
    end
  end
end
