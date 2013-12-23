class User < ActiveRecord::Base
	validates :name, :email, :address, :phone, presence: true
	validates :password, length: { minimum: 6 }, if: :password

	has_secure_password

  has_one :partner, class_name: "User", foreign_key: :partner_id
  belongs_to :inverse_partner, class_name: "User", foreign_key: :inverse_partner_id

	def is_admin?
		id.eql?(1)
	end

	def self.match
		r_users = User.all.shuffle
		n = User.count
		
		r_users.each_index do |u_index|
			if u_index.eql?(n-1)
				r_users[u_index].partner = r_users[0]
			else
				r_users[u_index].partner = r_users[u_index+1]				
			end
		end
	end
end
