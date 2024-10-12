class Ability
  include CanCan::Ability

  def initialize(user)
    # Guests (not logged in users) can read posts and comments
    can :read, Post
    can :read, Comment

    if user.present?
      # Logged in users can create posts and comments
      can :create, Post
      can :create, Comment

      # Users can edit or delete their own posts and comments
      can :update, Post, user_id: user.id
      can :destroy, Post, user_id: user.id

      can :update, Comment, user_id: user.id
      can :destroy, Comment, user_id: user.id
    end
  end
end
