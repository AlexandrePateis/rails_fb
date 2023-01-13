# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    return unless user.present?
    can :create, Comment
    can :read, Article, status: 'private', user_id: user.id    
    can :read, Article, status: 'archived', user_id: user.id
    can :read, Article, status: 'public'
    can [:update, :destroy], Article, user: user
    can :create, Article
    can :destroy, Comment, user_id: user.id

    return unless user.admin?

    can :manage, Article    #

  end
end
