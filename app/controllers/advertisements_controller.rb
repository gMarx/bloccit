class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end

  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def new
    @advertisement = Advertisement.new
  end

  def create
    @advertisement = Advertisement.create( advertisement_params )

    if @advertisement.save
      redirect_to @advertisement, notice: 'Advertisement was saved successfully.'
    else
      flash.now[:alert] = 'Error creating topic. Please try again.'
      render :new
    end
  end

  def edit
    @advertisement = Advertisement.new
    @advertisement.update_attributes( advertisement_params )

    if @advertisement.save
      flash[:notice] = 'Advertisement saved'
      redirect_to @advertisement
    else
      flash.now[:alert] = 'There was an error saving the post. Please try again.'
      render :new
    end
  end

  private

  def advertisement_params
    params.require(:advertisement).permit(:title, :copy, :price)
  end
end
