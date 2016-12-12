class PostsController < ApplicationController
	before_action :require_user, only: [:new, :edit]
	
	def index
		@title = "Welcome to My Page"

		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new

	end

	def create
		@post = Post.new(post_params)

		if(@post.save)
			redirect_to home_path
		else
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if(@post.update(post_params))
			redirect_to home_path
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end

	private def post_params
		params.require(:post).permit(:title, :body)
	end
end
