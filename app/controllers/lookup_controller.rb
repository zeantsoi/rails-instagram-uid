class LookupController < ApplicationController

	def index
		# Initialize instance variable to output messages to the view
		@return = Hash.new

		# Verify that the request is a POST
		if request.post?

			# If the access_token param is empty, use the access token from the initializer; otherwise use the access_token param
			access_token = params[:access_token].blank? ? INSTAGRAM_ACCESS_TOKEN : params[:access_token]

			# Initialize Instagram module with access_token
			Instagram.configure {|config| config.access_token = access_token}

			unless params[:username].blank?
			
				begin
					# Find users matching username (should only be one)
					users = Instagram.user_search(params[:username])
			
				# Rescue exception if access_token is incorrect
				rescue Exception => e
					access_token_error = if params[:access_token].blank?
						"The Access Token in your Instagram initializer is invalid"
					else
						"The Access Token entered is invalid"
					end
				end
			end

			begin
				# Map attributes of the first and only user in the users array
				user = users[0]
				attributes = {
					:id => user.id,
					:full_name => user.full_name,
					:website => user.website,
					:bio => user.bio,
					:profile_picture => user.profile_picture,
					:username => user.username,
				}
				# If any value in the attributes hash is blank, then remove the key value pair from the hash
				attributes.delete_if{|k, v| v.blank?}
			
			# If users array is empty, then no matching users were found
			rescue Exception => e
				username_error = "The username entered is not valid"
			end

			# Assign @return instance variable an error message if there was an exception, or the attributes hash if not
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
