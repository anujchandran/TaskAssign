class AccessController < ApplicationController
 
    layout "login_page"

    before_action :confirm_logged_in ,:except => [:login, :attempt_login,:logout]

	def index
	end

	def login
		if session[:user_id]
			redirect_path
		else
			render('login')
		end
	end

	def attempt_login
		if params[:username].present? && params[:password].present?
			found_user = User.where(:user_name => params[:username]).first
			if found_user
				authorized_user = found_user.authenticate(params[:password])
				if params[:remember_me]
        			cookies.permanent[:auth_token] = authorized_user.auth_token
     			 else
        			cookies[:auth_token] = authorized_user.auth_token
      			end
			end
		end
		if authorized_user
			session[:user_id] = authorized_user.id
			session[:user_name] = authorized_user.user_type
			flash[:notice] = "You are now logged in."
			redirect_path
		else
			flash[:notice] = "Invalid username/password combination."
			redirect_to(:action => 'login')
		end
	end

	def logout
		session[:user_id] = nil
		session[:user_name] = nil
		flash[:notice] = "Logged out"
		redirect_to(:controller => "access",:action => "login")
	end

	def redirect_path
		if session[:user_name]  == 'admin'
			redirect_to(:controller => 'users',:action => 'index')
		elsif session[:user_name]  == 'leader'
			redirect_to(:controller => 'project_controller',:action => 'index',:id => session[:user_id])
		else	
			redirect_to(:controller => 'task',:action => 'index',:id => session[:user_id])
		end
	end

end
