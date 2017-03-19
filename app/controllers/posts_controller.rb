class PostsController < ApplicationController

  before_action :find_post, only: [:show]

  def new
    @gallery = Gallery.find_by(id: params[:gallery_id])
    @post = Post.new
  end

  def create
    @gallery = Gallery.find(params[:gallery_id])
    @post = @gallery.posts.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = "Photo added to #{@gallery.name}"
      redirect_to @gallery
    else
      flash[:warning] = "Upload failed, please try again."
      redirect_to new_photo_path
    end
  end

  def show
  end

  def find_post
    @post = Post.find(params[:id])
  end


  private

  def post_params
    params.require(:post).permit(:caption, :photo)
  end


end
