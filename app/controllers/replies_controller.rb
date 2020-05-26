class RepliesController < ApplicationController
  def index
  end
  def new
    @reply = Reply.new
  end
  def create
    @reply = Reply.new(
      content: params[:content],
      user_id: @current_user[:id],
      post_id: params[:post_id]
    )
    if @reply.save
      flash[:notice] = "repliyed successfully!!"
      redirect_to("/posts/#{@reply.post_id}")
    else 
      render("replies/new")
    end
  end
end
