class User < ActiveRecord::Base
	validates :name, presence: true
	validates :email, presence: true
	validates :password, length: { minimum: 6 }
	validates :address, presence: true
	validates :phone, presence: true

	has_secure_password

    has_one :partner, class_name: "User", foreign_key: :partner_id
    belongs_to :inverse_partner, class_name: "User", foreign_key: :inverse_partner_id

	def is_admin
		id == 1
	end

	def self.match
		if User.count % 2 == 1
  			nil
  		else
			r_users = User.all.shuffle
			n = r_users.length

			aka = r_users.slice(0..n/2-1)
			shiro = r_users.slice(n/2..n)

			aka.each_index do |x|
				aka[x].partner = shiro[x]
				shiro[x].partner = aka[x]
			end
		end
	end
end
