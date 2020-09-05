require './config/environment'

class AuthenticationController < Sinatra::Base
  get '/signup' do
    erb :'/authentication/signup'
  end

  post "/signup" do
    # Create a new ActiveRecord object using params submitted by Sinatra
    @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
    
    # user.save returns either true or false if the above user is filled out or not
    # We can use this literally as a condition instead of just erroring out
    if @user.save
      session[:user_id] = @user.id
      redirect "/books_list"
    else
      redirect "/"
    end
  end
end
