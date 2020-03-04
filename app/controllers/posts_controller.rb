class PostsController < ApplicationController
  http_basic_authenticate_with name: 'Tausif', password: '123', except: [:index, :show]
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id]) #pass the post id from URL
  end

  def new
    # @post can't be blank, so creating a new instance from db
    @post = Post.new
  end

  def create
    # render plain: params[:post].inspect
    @post = Post.new(post_params)
    if (@post.save)
      redirect_to @post #loads up the SHOW method
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id]) #pass the post id from URL
  end

  def update
    @post = Post.find(params[:id]) #pass the post id from URL
    
    if (@post.update(post_params))
      redirect_to @post #loads up the SHOW method
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private def post_params
    params.require(:post).permit(:title, :body)
  end

end
