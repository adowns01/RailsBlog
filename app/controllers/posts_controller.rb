class PostsController < ApplicationController
  def index
    @posts = Post.all

    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def show
    id = params[:id]
    @post = Post.find(id)
  end

  def create
    post_info = {
      title: params[:title],
      body: params[:body],
      author: params[:author]
    }


    post = Post.create(post_info)
    redirect_to('/posts/' + post.id.to_s)
  end

  def new
    redirect_to ('/posts') if !session[:user_id]
    # This is supposed to be empty
  end

  def edit
    redirect_to ('/posts') if !session[:user_id]

    id = params[:id]
    @post = Post.find(id)
  end

  def update
    id = params[:id]
    post = Post.find(id)

    post_info = {
      title: params[:title],
      body: params[:body],
      author: params[:author]
    }

    post.update_attributes(post_info)

    redirect_to('/posts/' + post.id.to_s)

  end

  def destroy
    id = params[:id]
    post = Post.find(id)
    post.destroy

    redirect_to('/posts/')

  end
end
