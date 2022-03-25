# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :curren_user, :listing

  def initialize(current_user, listing)
    @current_user = current_user
    @listing = listing
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    @current_user.role == 'admin'
  end

  def new?
    @current_user.role == 'admin'
  end

  def update?
    @current_user.role == 'admin'
  end

  def edit?
    @current_user.role == 'admin'
  end

  def destroy?
    @current_user.role == 'admin'
  end

  # class Scope
  #   def initialize(user, scope)
  #     @user = user
  #     @scope = scope
  #   end

  #   def resolve
  #     scope.all
  #   end

  #   private

  #   attr_reader :user, :scope
  end
end
