class UsersController < ApplicationController

  def signup
    user_info = {
      username: params[:username],
      password: params[:password]
    }

    user = User.create(user_info)
    session[:user_id] = user.id

    redirect_to ('/posts')

  end

  def login
    user = User.find_by_username(params[:username])

    if user && user.password == params[:password]
      session[:user_id] = user.id
    end

    redirect_to ('/posts')

  end

  def logout
    session.clear
    redirect_to ('/posts')
  end

end