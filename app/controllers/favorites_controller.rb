class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all
  end

    def create
      favorite = current_user.favorites.create(feed_id: params[:feed_id])
      redirect_to feeds_path, notice: "you added #{favorite.feed.user.name}'s post to your favorites"
    end
  
    def destroy
      favorite = current_user.favorites.find_by(id: params[:id]).destroy
      redirect_to feeds_path, notice: "you have unfavorited #{favorite.feed.user.name}'s post"
    end
  end
