class PostsController < ApplicationController

  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit,:update,:delete]}

  def index
    # all.orderで作られた順に並ぶようにしている
    @posts = Post.all.order(created_at: :desc)
  end

  # show アクションを追加
  def show
    # @id = params[:id]
    @post = Post.find_by(id: params[:id])
  end

  # newアクションを追加
  def new
    @post = Post.new
  end

  # createアクションを追加
  def create
    @post = Post.new(
      content: params[:content],
      user_id: @current_user.id 
    )
    if @post.save
      flash[:notice] = "Saved the post."
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  # editアクションを追加
  def edit
    @post = Post.find_by(id: params[:id])
  end

  # update アクションを追加
  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
        flash[:notice] = "Edited the post."
        redirect_to("/posts/index")
    else 
        render("/posts/edit")
    end
  end

  # destroyアクションを追加
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "Delete the post."
    redirect_to("/posts/index")
  end

  # ensure_correct_user 2つめの定義
  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "You don't have the authority."
      redirect_to("/posts/index")
    end
  end

end
