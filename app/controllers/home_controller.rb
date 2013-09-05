class HomeController < ApplicationController
  def index
  	@post = Post.order("created_at DESC")
    @task_num = @post.inject(0) { |sum, i| sum + (i.task_type == "task" ? 1 : 0) } + 1
    @request_num = @post.inject(0) { |sum, i| sum + (i.task_type == "request" ? 1 : 0) } + 1
  end

  def about
  end
  
end
