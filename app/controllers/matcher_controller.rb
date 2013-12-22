class MatcherController < ApplicationController
  def generate
  	if current_user && current_user.is_admin?
  		if User.match.nil?
  			@error = 'There is an odd number of registered users.'
		end
	else
		@error = 'You are not authorized to perform this action.'
	end
  end

  def show
  	if current_user
  		if current_user.partner
  			@partner = current_user.partner
  		else
  			@error = 'You do not have a partner... yet. :('
  		end
  	else
		@error = 'You are not authorized to perform this action.'
  	end
  end
end
