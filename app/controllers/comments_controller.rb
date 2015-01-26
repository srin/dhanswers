class CommentsController < ApplicationController
  before_action :set_comments, only: [:show, :edit, :update, :destroy]

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(comments_params)
		@comment.user = current_user

 #      if @comment.save
 #        redirect_to root_path, notice: 'Comment was successfully created.' 
 #      else
 #        render action: "new" 
 #      end
	# end

	#   def create
 #    @link = Link.find(params[:link_id])
 #    @comment = @link.comments.new(comment_params)
 #    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @link, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

	def destroy
    	@comment.destroy
    		respond_to do |format|
      	format.html { redirect_to :back, notice: 'Comment was successfully destroyed.' }
      	format.json { head :no_content }
    	end
  	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comments
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comments_params
      params.require(:comment).permit(:post_id, :body, :user_id)
    end
end
