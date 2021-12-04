class ListingPolicy
    attr_reader :curren_user, :listing
  
    def initialize(current_user, post)
      @current_user = current_user
      @listing = listing
    end
  
    def index?
      true
    end
  
    def show?
      true
    end
  
    def create?
      # user.has_role?(:admin)
      true
    end
  
    def new?
      create?
    end
  
    def update?
      @current_user.role == 'admin'
    end
  
    def edit?
      update?
    end
  
    def destroy?
      create?
    end
  
    class Scope
      def initialize(user, scope)
        @user = user
        @scope = scope
      end
  
      def resolve
        scope.all
      end
  
      private
  
      attr_reader :user, :scope
    end
  end
  