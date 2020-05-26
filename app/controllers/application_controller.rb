class ApplicationController < ActionController::Base
    before_action :set_current_user
    
    def  forbit_login_user
        if @current_user
            flash[:notice] = "すでにloginしています"
            redirect_to('/posts/index')
        end
    end
    def set_current_user
      @current_user = User.find_by(id: session[:user_id])
    end
    def authenticate_user
        if @current_user == nil
            flash[:notice] = "loginが必要です"
            redirect_to("/login")
        end
    end
    def ensure_current_user #userの対応をとる関数
        if @current_user.id != params[:id].to_i
            falsh[:notice] = "権限がありません"
            redirect_to('/posts/index')
        end
    end
    def ensure_correct_user #post user_idの対応をとる
        @post = Post.find_by(id: params[:id])
        if @post.user.id != @current_user.id
            flash[:notice] = "権限がありません"
            redirect_to("/posts/index")
        end
    end
end
