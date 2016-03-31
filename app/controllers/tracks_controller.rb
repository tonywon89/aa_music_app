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

  end

  def update
  end

  def show
  end

  private
  def track_params
    params.require(:track).permit(:album_id, :name, :track_type, :lyrics)
  end
end
