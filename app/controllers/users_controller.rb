class UsersController < ApplicationController
  def index
    @users = User.all.order(created_at: :desc)
  end

  # ユーザー詳細ページ
  def show
    # user/:id ってきた時にidがparamsに入る、、、
    @user = User.find_by(id: params[:id])
  end

  # 新規登録ページ
  def new
    @user = User.new
  end

  # フォームからparamsで情報を受け取って保存するアクション
  def create
    @user = User.new(name: params[:name], email: params[:email])
    if @user.save
      flash[:notice] = "Save!!"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end

end
