require './config/environment'

class ApplicationController < Sinatra::Base
  @@site_title = "Fireside" 

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  helpers do
		def is_logged_in?
			!!session[:user_id]
    end
    
    def no_permit
      if is_logged_in? == false
        redirect to "/access_denied"
      end
    end

    def already_authenticated
      if is_logged_in? == true
        redirect to "/"
      end
    end

		def current_user
			User.find(session[:user_id])
		end
	end

  get "/" do
    erb :index
  end

end
