class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new

  end


  def create
    # we would like to also save the user information with the post
    # params?

      # params.require(:post).permit(:title, :content))
      @post.user = Post.new(post_params)
      @post.user = current_user
      @post.save

      redirect_to "/"

  end

  #edit update and delete
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to "/"
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user == current_user
    @post.destroy
  else
    flash[:alert] = "Only the author of the post  can do that."
    redirect_to "/"
  end
end

  # all private methods at the bottom
  private



  def post_params
    params.require(:post).permit(:title, :content)
  end
end


# you can copy and paste the value
