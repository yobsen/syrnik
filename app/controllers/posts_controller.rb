class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: :desc)
  end

  def new
    @post = Post.new
    @pets = Pet.pluck(:name, :id)
  end

  def create
    # This action uses POST parameters. They are most likely coming
    # from an HTML form which the user has submitted. The URL for
    # this RESTful request will be "/clients", and the data will be
    # sent as part of the request body.
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    redirect_to posts_path if @post.destroy
  end


  private

  def post_params
    params.require(:post).permit(:weight, :description, :photo)
  end
end


