class User < ApplicationRecord

	def self.from_omniauth(auth_info)
		find_or_create_by(uid: auth_info['id']) do |user|
			user.uid 	 = auth_info['id']
			user.name  = auth_info['login']
		end
	end

end
