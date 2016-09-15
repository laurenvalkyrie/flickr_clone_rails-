class ImagesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
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

  def edit
    @image = Image.find(params[:id])
    @users = User.all
    render 'edit'
  end

  def update
    @image = Image.find(params[:id])
    @user_tagged = User.find(params[:tagged_user_id])
    @user = User.find(current_user)
    @image.tagged_users.push(@user_tagged)
    @user_tagged.tagged_images.push(@image)

    if @image.update(image_params)
        redirect_to image_path(@image)
    else
      render 'edit'
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to root_path
  end

  private

  def image_params
    params.require(:image).permit(:caption, :image, :user_id)
  end
end
