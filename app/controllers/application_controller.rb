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
    def redirect_if_not_logged_in
      if !is_logged_in?
        flash[:error] = "You must be logged in to view that page"
        redirect "/login"
      end
    end

    def redirect_if_not_authorized
      redirect_if_not_logged_in
      if !authorize_book_report(@book_report)
        flash[:error] = "You don't have permission to do that action"
        redirect "/book_reports"
      end
    end
  
    def authorize_book_report(report)
      current_user == report.user
    end

    def set_book_report
      @book_report = BookReport.find_by_id(params[:id])
      if @book_report.nil?
        flash[:error] = "Couldn't find a book with id: #{params[:id]}"
        redirect "/books"
      end
    end

    def set_book
      @book = Book.find_by_id(params[:id])
      if @book.nil?
        flash[:error] = "Couldn't find a book with id: #{params[:id]}"
        redirect "/books"
      end
    end

		def is_logged_in?
			!!current_user
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
			User.find_by_id(session[:user_id])
		end
	end

  get "/" do
    erb :index
  end

end
