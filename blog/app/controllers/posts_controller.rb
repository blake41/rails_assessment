class PostsController < ApplicationController
  before_action :find_posts, :only => [:update, :edit, :show, :destroy]

   def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    
      if @post.save
       redirect_to @post
      else
       render 'new'
      end
  end

  def update
      if @post.update(params[:post].permit(:title, :text))
        redirect_to @post
      else
        render 'edit'
      end
  end

  def edit
  end

  def show
  end

  def destroy
    @post.destroy
 
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :text)
    end

    def find_posts
      @post = Post.find(params[:id])
    end

end