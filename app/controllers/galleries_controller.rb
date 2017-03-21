class GalleriesController < ApplicationController

  before_action :is_owner, only: [:edit, :update, :destroy]
  before_action :find_gallery, only: [:show, :edit, :update, :destroy, :shares, :send_to]
  before_action :require_user, except: [:index, :show, :shares, :send_to]


  def index
    @galleries = Gallery.all
  end

  def show
    @posts = @gallery.posts
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = current_user.galleries.new(gallery_params)
    if @gallery.save
      flash[:success] = "Gallery created."
      redirect_to @gallery
    else
      flash[:danger] = "Something went wrong."
      render :new
    end
  end

  def edit
  end

  def update
    if @gallery.update(gallery_params)
      flash[:success] = "Gallery updated!"
      redirect_to @gallery
    else
      flash[:warning] = "Something went wrong, please try again."
      redirect_to edit_gallery_path
    end
  end

  def destroy
    @gallery.destroy
    flash[:success] = "#{@gallery.name} deleted."
    redirect_to :root
  end

  def shares
  end

  def send_to
    @send_to = params[:share][:send_to]
    GalleryMailer.share(@gallery, @send_to, current_user).deliver
    flash[:success] = "Gallery has been successfully shared!"
    redirect_to @gallery
  end


  private

  def gallery_params
    params.require(:gallery).permit(:name)
  end

  def find_gallery
    @gallery = Gallery.find(params[:id]) if params[:id]
  end

  def is_owner
    @gallery = Gallery.find_by(id: params[:id])
    unless @gallery.user == current_user
      flash[:warning] = "That's not your gallery."
      redirect_to :root
    end
  end

end
