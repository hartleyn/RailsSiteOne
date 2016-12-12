class PagesController < ApplicationController
	before_action :require_admin, only: [:admin]

	def about
		@title = "About Us!"
	end

	def admin
		@users = User.all
	end
end
