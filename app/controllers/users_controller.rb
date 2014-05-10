class UsersController < ApplicationController


  before_action :confirm_logged_in

  def index
    @users = User.sorted.paginate(:page => params[:page], :per_page => 5)
    # @users = User.search(params[:search])
  end

  def show
    @users =User.find(params[:id])
  end

  def new
    @users = User.new
  end

  def create
    @users = User.new(user_param)
    if @users.save
      flash[:notice] = "User created succefully."
      redirect_to(:action =>'index')
    else
      render('new')
    end
  end

  def edit
    @user =User.find(params[:id])
  end

  def update
    @users =User.find(params[:id])
    
    if @users.update_attributes(user_param)
      flash[:notice] = "User details updated succefully."
      redirect_to(:action =>'show', :id => @users.id)
    else
      render('edit')
    end
  end


  def delete
    @users =User.find(params[:id])
  end

  def destroy
    user =User.find(params[:id])
    user.destroy
    flash[:notice] = "'#{user.user_name}' deleted succefully."
    redirect_to(:action =>'index')
  end

  private 

  def user_param
    params.require(:user).permit(:first_name,:last_name,:user_name,:email,:is_active,
      :password,:password_confirmation,:user_type,:team_id)
  end

end