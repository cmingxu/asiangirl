class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :roles, :login
  # attr_accessible :title, :body
  
  before_create do |u|
    u.roles = "normal"
  end 

  def normal?
    !admin?
  end

  def admin?
    self.roles.split(" ").include? "admin" 
  end
end
