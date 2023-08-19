# class Ability
#   include CanCan::Ability

#   def initialize(user)
#     user ||= User.new # guest user (not logged in)

#     if user.persisted? # Logged-in user
#       can :read, Post
#       can :create, Post
#       can :update, Post, user_id: user.id
#       can :destroy, Post, user_id: user.id
#       can [:like, :dislike], Post
#       can [:like, :dislike], Comment
#       can :share, Post # Assuming you have a "share" action
#     else # Guest user
#       can :read, Post
#       can [:like, :dislike], Post
#     end
#   end
# end


class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.admin?
      can :manage, :all # Admin can manage all resources
    elsif user.persisted? # Logged-in user
      can :read, Post
      can :create, Post
      can :update, Post, user_id: user.id
      can :destroy, Post, user_id: user.id
      can [:like, :dislike], Post
      can [:like, :dislike], Comment
      can :share, Post # Assuming you have a "share" action
    else # Guest user
      can :read, Post
      can [:like, :dislike], Post
    end
  end
end
