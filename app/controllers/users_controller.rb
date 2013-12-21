class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
    if current_user
      redirect_to root_url
    end

  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		session[:user_id] = @user.id
  		redirect_to root_url
  	else
  		render 'new'
  	end
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation, :address, :phone)
  	end
end
