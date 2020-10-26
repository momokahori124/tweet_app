class ApplicationController < ActionController::Base

    # アプリケーション起動時に実行してくれるアクション
    before_action :set_current_user
  
    def set_current_user
      @current_user = User.find_by(id: session[:user_id])
    end

    def authenticate_user
        puts "--------------------------------------"
        if @current_user == nil
            puts "============================================"
            flash[:notice] = "ログインが必要です"
            redirect_to("/login") 
        end
    end

    def forbid_login_user
        if @current_user
            flash[:notice] = "You're already logged in."
            redirect_to("/posts/index")
        end
    end

    def ensure_correct_user
        if @current_user.id != params[:id].to_i
            flash[:notice] = "You don't have the authority."
            redirect_to("/posts/index")
        end
    end

end
