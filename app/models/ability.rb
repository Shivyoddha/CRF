class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)


    if user.admin_role?
      can :manage, :all
      can :access, :slotbooker
      can :access, :rails_admin  # only admin can access Rails Admin
      can :manage, :dashboard
 # allow access to dashboard

else if user.chairman_role?
     can :access, :rails_admin

      can :read, :all
    end
  end
end
