class ArtworksController < ApplicationController
  # [:index, :create, :show, :update, :destroy]
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @artworks = @user.artworks + @user.shared_artworks
    else
      @artworks = Artwork.all
    end
    render json: @artworks
  end

  def create
    @artwork = Artwork.new(artwork_params)
    if @artwork.save
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @artwork = Artwork.find(params[:id])
    render json: @artwork
  end

  def update
    @artwork = Artwork.find(params[:id])
    if @artwork.update(artwork_params)
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    Artwork.delete(params[:id])
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end
