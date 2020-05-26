class PostsController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update, :destory]
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  def show
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
    @replies = Reply.where(post_id: @post.id)
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(
      content: params[:content],
      user_id: @current_user[:id],
      year: params[:year],
      no: params[:no]
    )
    if @post.save
      flash[:notice] = "posted successfully!!"
      redirect_to("/posts/index")
    else 
      render("posts/new")
    end
  end
  def edit
    @post = Post.find_by(id: params[:id])
    
  end
  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "updated successfully!!"
      redirect_to("/posts/index")
    else 
      render("posts/edit")
    end
  end
  def destroy
    @post = Post.find_by(id: params[:id])
    if @post.destroy
      flash[:notice] = "deleted successfully!!"
    end
    redirect_to("/posts/index")
  end
  def search
    @posts = Post.where(year: params[:year], no: params[:no])
  end
end
