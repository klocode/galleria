class PostsController < ApplicationController

  before_action :is_owner, only: [:edit, :update, :destroy]
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:new, :create, :destroy]
  before_action :find_gallery


  def new
    @post = Post.new
  end

  def create
    @post = @gallery.posts.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = "Photo added to #{@gallery.name}"
      redirect_to @gallery
    else
      flash[:warning] = "Upload failed, please try again."
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Photo updated!"
      redirect_to @post
    else
      flash[:warning] = "Something went wrong, please try again."
      redirect_to edit_gallery_post_path
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Photo deleted."
    redirect_to gallery_path
  end



  private

  def find_post
    @post = Post.find(params[:id])
  end

  def find_gallery
    @gallery = Gallery.find(params[:gallery_id])
  end

  def post_params
    params.require(:post).permit(:caption, :photo)
  end

  def is_owner
    @post = Post.find_by(id: params[:id])
    unless @post.user == current_user
      flash[:warning] = "You can't touch this."
      redirect_to :root
    end
  end


end
