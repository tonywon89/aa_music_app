class AlbumsController < ApplicationController
  def index
    band_id = params[:band_id]
    @band = Band.find_by(id: band_id)
    @albums = Album.where(band_id: band_id)

  end

  def new
    @bands = Band.all
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to band_albums_url(@album.band)
    else
      @bands = Band.all
      flash.now[:errors] = "Cannot make that album"
      render :new
    end
  end

  def show
    @album = Album.find_by(id: params[:id])
  end

  def edit
    @bands = Band.all
    @album = Album.find_by(id: params[:id])
  end

  def update
    @album = Album.find_by(id: params[:id])

    if @album.update(album_params)
      redirect_to band_albums_url(@album.band)
    else
      @bands = Band.all
      flash.now[:errors] = "Cannot update that album"
      render :edit
    end
  end

  def destroy
    @album = Album.find_by(id: params[:id])
    band = @album.band

    @album.destroy
    
    redirect_to band_albums_url(band)
  end



  private
  def album_params
    params.require(:album).permit(:name, :band_id, :album_type)
  end
end
