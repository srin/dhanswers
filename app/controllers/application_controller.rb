class ApplicationController < ActionController::Base
before_filter :list_posts
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end

def list_posts
	@q = Post.ransack(params[:q])
end

def list_users
	@user = User.all
	@userlist = @user.order("karma DESC").limit(5)
end

