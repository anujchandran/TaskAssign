class ProjectControllerController < ApplicationController

  before_action :confirm_logged_in

  def show
    @project = ProjectTable.find(params[:id])
  end

  def index
    if (params[:id])
      @projects = ProjectTable.where(user_id: params[:id])
    else
      @projects = ProjectTable.all
    end
  end

  def new
    @project = ProjectTable.new
  end

  def create
    @project = ProjectTable.new(project_param)
    if @project.save
      flash[:notice] = "succefully added the project"
      redirect_to(:action =>'index')
    else
      render('new')
    end
  end

  def history
    @projects = ProjectTable.where(status: "finished")
    render('index')
  end

  def delete
  end

  def edit
  end

  private

  def project_param
    params.require(:project_table).permit(:user_id,:project_name,:start_date,:end_date,:owner_name,:time_spend,
      :status,:task_id)
  end
end
