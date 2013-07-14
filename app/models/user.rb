class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :email, :password, :password_confirmation, :stripe_id
  has_many :albums

	validates :email, :uniqueness => true
	validates_presence_of :password, :on => :create
	validates_confirmation_of :password

end
