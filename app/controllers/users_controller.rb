class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			session[:user_id] = @user.id
			redirect_to '/'
		else
			redirect_to '/signup'
		end
	end

	def update
		@user = User.find(params[:id])

		if(@user.update(user_params))
			render(
			    html: "<script>alert('Changes saved.')</script>".html_safe,
			    layout: 'application'
		    ) 
		else
			render '/'
		end
	end

	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :password)
		end
end
