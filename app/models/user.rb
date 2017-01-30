class User < ApplicationRecord

	def from_omniauth(auth_info)
		find_or_create_by(uid: auth_info['id']) do |new_user|
			user.provider = auth_info['provider']
			user.uid = auth_info['id']
			user.name = auth_info['name']				
		end
	end

end
