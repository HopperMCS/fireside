require 'pry'
class AuthenticationsController < ApplicationController
  get '/signup' do
    @user = User.new
    already_authenticated
    erb :'./authentication/signup'
  end

  post "/signup" do
    # Create a new ActiveRecord object using params submitted by Sinatra
    @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])

    if @user.save
      session[:user_id] = @user.id
      redirect "/books"
    else
      erb :"/authentication/signup"
    end
  end

  get '/login' do
    already_authenticated

    erb :'/authentication/login'
  end

  post "/login" do
    @user = User.find_by(:username => params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
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
