class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @user = User.find(current_user.id)
    @image = @user.images.new(image_params)
    if @image.save
      flash[:success] = "The image was added!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def image_params
    params.require(:image).permit(:caption, :image, :user_id)
  end
end
