class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :set_role
  
  enum role: [:user, :admin]
  after_initialize do
    if self.new_record?
      self.role ||= :user
    end

end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_many :listings, dependent: :destroy 

# include DeviseTokenAuth::Concerns::ActiveRecordSupport
# include DeviseTokenAuth::Concerns::User
  def set_role
    self.add_role(:user) if self.role.nil?
  end



end


