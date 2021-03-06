class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

    user ||= User.new # guest user (not logged in)

    # can :manage, :all

    if user.admin?
      can :manage, :all
    else

      if !(user.recept? || user.dr? || user.cust?)
        # can :manage, :all
        can :manage, :none
      else

        if user.recept?
          can :read, :all
          can :manage, [User,Pet,Appointment]
        end

        if user.dr?
          can :read, :all
          can :manage, Pet
        end

        if user.cust?
          can :read, User do |obj|
            obj.id == user.id
          end
          can :read, Pet do |obj|
            obj.user_id == user.id
          end
          can :read, Appointment do |obj|
            obj.user_id == user.id
          end

          can :update, User do |obj|
            obj.id == user.id
          end
          can :update, Pet do |obj|
            obj.user_id == user.id
          end
        end
      end


    end

  end
end
