module ApplicationHelper
    def author_of(listing)
        user_signed_in? && listing.users_id == current_user.id
      end
    
      def admin?
        user_signed_in? && current_user.admin?
      end
    # //defines the admin/userid status of the user

end
