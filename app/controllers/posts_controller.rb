class PostsController < ApplicationController
  def create
  	@post = Post.new(post_params)
    @post.status = 'f'
  	if @post.save
  		flash[:success] = "已成功添加新任务."
      redirect_to :root
    else
    	flash[:error] = "哦No，添加新任务失败了."
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
    @post.task_type = params[:post][:task_type]
    if @post.save
    	flash[:info] = "已更新任务."
      redirect_to :root
    else
    	flash[:error] = "哦No，更新任务失败了."
      render :edit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:info] = "已删除任务."
    redirect_to root_path
  end
  
  def done
    @post = Post.find(params[:id])
    @post.status = 't'
    @post.save
    flash[:info] = "已更新#{@post.task_type == "task" ? "计划:" : "任务:"}#{@post.title}状态至→完成."
    redirect_to root_path
  end

  def undone
    @post = Post.find(params[:id])
    @post.status='f'
    @post.save
    flash[:info] = "已更新#{@post.task_type == "task" ? "计划:" : "任务:"}#{@post.title}状态至→未完成."
    redirect_to root_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :text, :task_type)
    end
end
