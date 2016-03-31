class BandsController < ApplicationController

  def index
    @bands = Band.all
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to bands_url
    else
      flash.now[:errors] = "That band name has already been taken"
      render :new
    end
  end

  def edit
  end

  def show
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end