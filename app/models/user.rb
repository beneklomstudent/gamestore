class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

# include DeviseTokenAuth::Concerns::ActiveRecordSupport
# include DeviseTokenAuth::Concerns::User
  

has_many :listings, dependent: :destroy 

end


