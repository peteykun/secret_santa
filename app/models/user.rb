class User < ActiveRecord::Base
	validates :name, presence: true
	validates :email, presence: true
	validates :password, length: { minimum: 6 }
	validates :address, presence: true
	validates :phone, presence: true

	has_secure_password
end
