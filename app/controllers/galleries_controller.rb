class GalleriesController < ApplicationController

  before_action :find_gallery, only: [:show]
  before_action :require_user, only: [:new, :create, :destroy]


  def index
    @galleries = Gallery.all
  end

  def show
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

  def destroy
    @gallery.destroy
    flash[:success] = "#{@gallery.name} deleted."
    redirect_to :root
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
