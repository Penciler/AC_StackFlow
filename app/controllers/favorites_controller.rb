class FavoritesController < ApplicationController

  def index
    @favorite_questions = current_user.favorites_questions
    @user = current_user
  end

end
