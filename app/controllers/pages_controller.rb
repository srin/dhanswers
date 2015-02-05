class PagesController < ApplicationController
	before_action :list_posts
	before_action :list_users, only: [:home, :leaderboard] 


  def home
  	    @posts =  @q.result.order("created_at DESC").limit(5)
  end

  def about
  end

  def leaderboard
  	
  end

  def contact
  end

  def faq
  	
  end
end
