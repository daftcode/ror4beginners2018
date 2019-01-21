class ArtistsController < ApplicationController
  def index
  	@artists=Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(artist_params)
    if @artist.persisted?
      redirect_to artists_url, notice: 'Artist has been saved'
    else
      render 'new'
    end
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      redirect_to artists_url, notice: 'Artist has been updated'
    else
      render 'edit'
    end
  end

  def edit
  	@artist = Artist.find(params[:id])
  	render :new
  end

  def show
  	@artist = Artist.find(params[:id])
  end	

  def destroy
    Artist.destroy(params[:id])
    redirect_to artists_url, notice: 'Artist has been removed'
  end

  private

  def artist_params
    params.require(:artist).permit(:name)
  end
end
