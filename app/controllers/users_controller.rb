class UsersController < ApplicationController
  	def new
    	@user = User.new
  	end

  	def show
  		@user = User.find(params[:id])
  		#debugger
  	end

  	def create
    	#@user = User.new(params[:user])    # Not the final implementation!
    	@user = User.new(user_params)
	    if @user.save
	      	flash[:success] = "Welcome to the Sample App!"
	      	redirect_to @user #redirecting to the newly created user’s profile
	    else
	      	render 'new'
	    end
  	end

  	private

    def user_params
      	params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
