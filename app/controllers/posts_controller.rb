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
    render :new if @post.invalid?
  end

  def create
    @post = Post.new(post_params)
    if params[:back]
      render :new
    else
      if @post.save
        redirect_to posts_path, notice: "ささやきました！"
      else
        render :new
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if params[:back]
      render :edit
    else
      if @post.update(post_params)
        redirect_to posts_path, notice: "ささやきを編集しました！"
      else
        render :edit
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "ささやきを削除しました！"
  end

  private
  
  def post_params
    params.require(:post).permit(:id, :content)
  end
end
