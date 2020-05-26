class UsersController < ApplicationController
  before_action :set_current_user
  before_action :authenticate_user, {only: [:edit, :update]}
  before_action :forbit_login_user, {only: [:new, :create, :login_form, :login]}
  def index
    @users = User.all.order(created_at: :desc)
  end
  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(
      name: params[:name], 
      email: params[:email],
      image_name: "default_user.jpg",
      password: params[:password],
      bio: params[:bio],
    )
    if @user.save
      flash[:notice] = "signuped successfully!!"
      session[:user_id] = @user.id
      redirect_to("/users/index")
    else 
      render("users/new")
    end
  end
  def edit
    @user = User.find_by(id: params[:id])
  end
  def update
    @user = User.find_by(id: params[:id])
    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end
      if @user.save
      flash[:notice] = "updated successfully!!"
      redirect_to("/")
    else 
      render("users/edit")
    end
  end
  def login_form
    @user = User.new
  end
  def login
    @user = User.find_by(
      email: params[:email],
      password: params[:password],
    )
    if @user
      flash[:notice] = "logged in successfully!"
      session[:user_id] = @user.id
      redirect_to("/")
    else
      flash[:notice] = "login failed..."
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end
  def logout
    session[:user_id] = nil
    redirect_to("/users/index")
  end
end
