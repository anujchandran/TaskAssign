class TaskController < ApplicationController

  before_action :confirm_logged_in

  def index
    @tasks =Task.where(user_id: params[:id]).order("position") 
  end

  def show
    @task =Task.find(params[:id])
  end

  def new

    @task = Task.new
    @project_id = params[:id]
  end

  def create
    @task = Task.new(task_param)
    if @task.save
      flash[:notice] = "Task  added succefully."
      @user = User.find(@task.user_id)
      # notify_friend(@task)
      redirect_to(:action =>'index')
    else
      render('new')
    end
  end

  def edit
    @task =Task.find(params[:id])
  end


  def update
    @task =Task.find(params[:id])
    if @task.update_attributes(task_param)
      flash[:notice] = "User details updated succefully."
      redirect_to(:action =>'show', :id => @task.id)
    else
      render('edit')
    end
  end


  def notify_friend(task)
    Notifier.login_notifier(task).deliver
  end

  def delete
  end

  def sort
    params[:task].each_with_index do |id, index|
      Task.update_all({position: index+1},{id: id})
    end
    render nothing: true
  end

  private 

  def task_param
    params.require(:task).permit(:user_id,:task_name,:tracker,:description,:status,
      :priority,:start_date,:end_date,:estimated_hours,:per_done,:project_table_id,:file_avatar)
  end
end
