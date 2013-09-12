class HomeController < ApplicationController

  def index
  	@post = Post.order("created_at DESC").paginate(:per_page => 20, :page => params[:page])
    @task_num = @post.inject(0) { |sum, i| sum + (i.task_type == "task" ? 1 : 0) } + 1
    @request_num = @post.inject(0) { |sum, i| sum + (i.task_type == "request" ? 1 : 0) } + 1
  	session[:see_all_flag] ||= 1
  end

  def about
  end

  def see_undone
  	session[:see_all_flag] = 0
  	redirect_to root_path
  end

  def see_all
  	session[:see_all_flag] = 1
  	redirect_to root_path
  end 
end
