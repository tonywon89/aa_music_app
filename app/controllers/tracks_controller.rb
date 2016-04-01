class TracksController < ApplicationController
  def index
    @tracks = Album.find_by(id: params[:album_id]).tracks
  end

  def new
    @track = Track.new
    @albums = Album.all
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to album_url(@track.album)
    else
      flash.now[:errors] = "Cannot save that track"
      @albums = Album.all
      render :new
    end
  end

  def edit
    @track = Track.find_by(id: params[:id])
    @albums = Album.all

  end

  def update
    @track = Track.find_by(id: params[:id])

    if @track.update(track_params)
      redirect_to album_url(@track.album)
    else
      flash.now[:errors] = @track.errors.full_messages
      @albums = Album.all
      render :edit
    end

  end

  def show
    @track = Track.find_by(id: params[:id])
  end

  def destroy
    @track = Track.find_by(id: params[:id])
    @album = @track.album

    @track.destroy

    redirect_to album_url(@album)
  end

  private
  def track_params
    params.require(:track).permit(:album_id, :name, :track_type, :lyrics)
  end
end
