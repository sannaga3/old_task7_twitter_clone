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
  end

  def edit
  end
  private
    def post_params
      params.require(:post).permit(:id, :content)
    end
end
