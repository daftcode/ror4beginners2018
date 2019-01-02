class ArtistsController < ApplicationController
    before_action :set_artist, only: %i[show update destroy edit]

    def index
        @artists = Artist.all
    end

    def new
        @artist = Artist.new
    end

    def show
        @artist = set_artist
    end

    def create
        @artist = Artist.new(artist_params)
        if @artist.save
            redirect_to artists_url, notice: 'Artist has been saved!'
        else
            render 'new'
        end
    end

    def destroy
        @artist.destroy!
        redirect_to artists_url, notice: 'Artist has been removed!'
    end

    def update
        if @artist.update(artist_params)
            redirect_to artist_url, notice: 'Artist has been updated!'
        else
            render 'edit'
        end
    end

    private 

    def set_artist
        @artist = Artist.find(params[:id])
    end

    def artist_params
        params.require(:artist).permit(:name)
    end
end
