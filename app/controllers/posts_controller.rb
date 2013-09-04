class PostsController < ApplicationController
  def create
  	@post = Post.new(post_params)
    @post.status = 'f'
  	if @post.save
      redirect_to :root
    else
      render :new
    end
  end
  
  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.title = params[:post][:title]
    @post.text = params[:post][:text]
    if @post.save
      redirect_to :root
    else
      render :edit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end
  
  def done
    @post = Post.find(params[:id])
    @post.status = 't'
    @post.save
    redirect_to root_path
  end

  def undone
    @post = Post.find(params[:id])
    @post.status='f'
    @post.save
    redirect_to root_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :text)
    end
end
