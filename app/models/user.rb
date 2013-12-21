class User < ActiveRecord::Base
	validates :name, presence: true
	validates :email, presence: true
	validates :password, length: { minimum: 6 }
	validates :address, presence: true
	validates :phone, presence: true

	has_secure_password

	def is_admin
		id == 1
	end
end
