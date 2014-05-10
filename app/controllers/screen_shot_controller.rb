class ScreenShotController < ApplicationController

	def cron_screenshot
		system("python anuj.py")
		create
		res = %x{rm -f -r screenshot.png}
		render :json => "success", :callback => 'updateRecordDisplay'    
  end

	def show
  		@shots = ScreenShot.where(user_id: params[:id]).order( 'id DESC' )
  		respond_to do |format|
  	  format.html
  	  format.json { render json: @shots }
  	end
	end


  private 

  def used_params
		params.require(:screen_shots).permit(:file_avatars,:user_id)
	end

	def create
    	f = File.open(Rails.root.join('screenshot.png'), 'rb')
    	shot = ScreenShot.new
    	shot.user_id = session[:user_id]
    	shot.file_avatars = f
    	shot.save
  	end
end
