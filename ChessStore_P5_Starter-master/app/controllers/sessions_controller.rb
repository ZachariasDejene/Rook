class SessionsController < ApplicationController
    def new

    end

    def create
      user = User.find_by_username(params[:username])
      if user && user.authenticate( params[:password])
        session[:user_id] = user.id
        session[:cart] ||= Hash.new
        redirect_to home_path, notice: "Logged in!"
      else
        flash.now.alert = "Username or password is invalid"
        render "new"
      end
    end

    def destroy
      session[:user_id] = nil
      session[:cart] = nil     
      redirect_to home_path, notice: "Logged out!"
    end
  end