class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :manage, :rails_admin

    if user.developer? # Assuming there is a 'developer' boolean attribute on the User model
    can :access, :rails_admin       # grant access to rails_admin
    can :manage, :all
  end
  end
end
