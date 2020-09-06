require 'pry'
class AuthenticationsController < ApplicationController
  get '/signup' do
    erb :'./authentication/signup'
  end

  post "/signup" do
    # Create a new ActiveRecord object using params submitted by Sinatra
    @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
    
    # Store username and email in vars so they can be run against the db
    username = @user.username
    email = @user.email

    # When testing in Pry, I noticed that when find_by comes up empty-handed, it spits nil
    # We can use this to our advantage to determine whether or not duplicates exist
    if User.find_by(:username => username, :email => email) == nil
      @user.save
      session[:user_id] = @user.id
      redirect "/books/index.html"
    else
      redirect "/login"
    end
  end

  get '/login' do
    erb :'/authentication/login'
  end

  post "/login" do
    user = User.find_by(:username => params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/books/index.html"
    else
      redirect "/login"
    end
  end

end
