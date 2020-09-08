require 'pry'
class AuthenticationsController < ApplicationController
  get '/signup' do
    already_authenticated
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
    if params[:username].empty?
      redirect to '/signup'
    elsif params[:email].empty?
      redirect to '/signup'
    elsif User.find_by(:username => username) == nil
      @user.save
      session[:user_id] = @user.id
      redirect "/books"
    else
      redirect "/login"
    end
  end

  get '/login' do
    already_authenticated
    erb :'/authentication/login'
  end

  post "/login" do
    user = User.find_by(:username => params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/books"
    else
      redirect "/login"
    end
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

  get "/access_denied" do
    erb :"/authentication/denied"
  end
end
