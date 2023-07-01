class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)
    if user && user.developer?
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      can :manage, :all                 # allow everyone to read everything
    end

    if user && user.admin_role?
      can :access, MainportalController
      can :manage, :all
    end

    if user && user.slotbooker == "media"
     can :access, Announcement
   else
     cannot :access, Announcement
    end
  end
end
