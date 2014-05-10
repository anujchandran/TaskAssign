class TeamController < ApplicationController
  
  before_action :confirm_logged_in

  def index
     @teams = Team.all.paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_param)
    if @team.save
      flash[:notice] = "Team Added to list."
      redirect_to(:action =>'index')
    else
      render('new')
    end
  end

  def show
    @team =Team.find(params[:id])
  end

  def edit
    @team =Team.find(params[:id])
  end

  def update
    @team =Team.find(params[:id])
    if @team.update_attributes(team_param)
      flash[:notice] = "Team Edited"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end


  def delete
  end

  private 

  def team_param
    params.require(:team).permit(:team_name,:description)
  end  
end
