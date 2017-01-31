class User < ApplicationRecord

	def self.from_omniauth(auth_info, token)
		find_or_create_by(uid: auth_info['id']) do |user|
			user.uid 	  	= auth_info['id']
			user.name   	= auth_info['name']
			user.location = auth_info['location'] #string
			user.token  	= token
			user.avatar 	= auth_info['avatar_url']
			user.public_repos  = auth_info['public_repos'] #integer
			user.public_gists  = auth_info['public_gists'] #integer
			user.private_gists = auth_info['private_gists'] #integer
		end
	end

end
