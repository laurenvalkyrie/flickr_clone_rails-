class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:success] = "The image was added!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def image_params
    params.require(:image).permit(:user_id, :caption)
  end
end
