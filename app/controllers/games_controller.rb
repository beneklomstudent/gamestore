class GameController < ApplicationController
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
        params.require(:name, :price).permit(genre_id: [])

    end


    def update
        @game.update(game_params)
        redirect_to @game
      end 

      def destroy
        @game.destroy
        # redirect_to games_path
      end

  end

end
