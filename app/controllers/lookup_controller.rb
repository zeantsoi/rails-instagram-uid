class LookupController < ApplicationController

	def index
		@return = Hash.new
		if request.post?
			puts INSTAGRAM_ACCESS_TOKEN
			access_token = params[:access_token].blank? ? INSTAGRAM_ACCESS_TOKEN : params[:access_token]
			Instagram.configure {|config| config.access_token = access_token}

			unless params[:username].blank?
				begin
					users = Instagram.user_search(params[:username])
				rescue Exception => e
					access_token_error = if params[:access_token].blank?
						"The Access Token in your Instagram initializer is invalid"
					else
						"The Access Token entered is invalid"
					end
				end
			end

			begin
				user = users[0]
				attributes = {
					:id => user.id,
					:full_name => user.full_name,
					:website => user.website,
					:bio => user.bio,
					:profile_picture => user.profile_picture,
					:username => user.username,
				}
				attributes.delete_if{|k, v| v.blank?}
			rescue Exception => e
				username_error = "The username entered is not valid"
			end

			@return = if access_token_error
				{:error => access_token_error}
			elsif username_error
				{:error => username_error}
			else
				attributes
			end

			respond_to do |format|
				format.js
				format.html	
			end
		end
	end

end
