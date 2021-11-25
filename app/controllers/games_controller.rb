class GameController < ApplicationController
    before_action :set_games_and_genres, only: [:new, :edit, :create]
    def create
        @game = Game.new(game_params)
        begin
            @game.save!
            redirect_to @game
        end
        def new
            @game = Game.new
          end

    def game_params
        params.require(:name).permit(genre_ids: [])

    end

    def update
        @game.update(game_params)
        redirect_to @game
      end 
      def destroy
        @game.destroy
        # redirect_to games_path
      end

      
  def set_games_and_genres
    @games = Game.order(:name)
    @genres = Genre.order(:genre)
  end

end
