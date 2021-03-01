class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def confirm
    @post = Post.new(post_params)
    @post.id = params[:id]
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: "ささやき完了"
    end
  end

  def edit
  end
  private
    def post_params
      params.require(:post).permit(:id, :content)
    end
end
