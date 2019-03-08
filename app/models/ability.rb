class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    
    if user.admin?
      can :manage, :all
    else
      can :read, ResumeEntry
      can :read, ResumeEntryNote
      can :read, ResumeEntryType
      can :create, NewsletterSignUp
    end

  end
end
