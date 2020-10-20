class PostsController < ApplicationController
  def index
    # all.orderで作られた順に並ぶようにしている
    @posts = Post.all.order(created_at: :desc)
    # @posts = [
    #   "apple",
    #   "banana",
    #   "chocolate",
    #   "desk",
    #   "english"
    # ]
  end

  # show アクションを追加
  def show
    # @id = params[:id]
    @post = Post.find_by(id: params[:id])
  end

  # newアクションを追加
  def new

  end

  # createアクションを追加
  def create
    @post = Post.new(content: params[:content])
    @post.save
    redirect_to("/posts/index")
  end

  # editアクションを追加
  def edit
    @post = Post.find_by(id: params[:id])
  end

  # update アクションを追加
  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    @post.save
    redirect_to("/posts/index")
  end

  # destroyアクションを追加
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/posts/index")
  end

end
