class GamesController < ApplicationController
  before_action :authenticate_user!
  
  # def game_params
  #   params.require(:game).permit(:name, :genre_id)
  # end
  
  
  def create
        @game = Game.new(game_params)
        begin
            @game.save!
            redirect_to @game
        end

        def new
            @game = Game.new
          end

   

    def initialize
      @errors = ActiveModel::Errors.new(self)
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
