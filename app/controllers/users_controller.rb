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
    @user = User.new(
      name: params[:name], 
      email: params[:email],
      image_name: "me.png",
      password: params[:password]
    )

    # ここでイメージが送られてこなければデフォルト画像が設定される
    if image = params[:image]
      @user.image_name = "#{@user.id}.jpg"
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end
  
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Save!!"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end

  # 編集用ページ
  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]

    if image = params[:image]
      @user.image_name = "#{@user.id}.jpg"
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end

    if @user.save
        flash[:notice] = "Update!"
        redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end

  # login機能

  def login_from
  end

  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "Login Success"
      redirect_to("/posts/index")
    else
      flash[:notice] = "Can't find User"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end

  end

  # logout機能

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end


end
