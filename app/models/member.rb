class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable, :validatable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :membership, :avatar
  attr_accessible :name, :address, :phone_number, :date_of_birth, :date_raised, :website
  
  mount_uploader :avatar, AvatarUploader
  
  validates_presence_of :membership
  validates_presence_of :name
  validates_presence_of :date_of_birth
  validates_presence_of :date_raised
  validates_presence_of :address
  validates_numericality_of :phone_number
  validates_presence_of :email
end
