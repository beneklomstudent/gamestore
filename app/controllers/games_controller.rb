class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game, only: [:update, :edit, :show, :destroy]

  def new
    @game = Game.new
  end


  def create
        @game = Game.new(game_params)
        begin
            @game.save!
            redirect_to @game
          # rescue
          #   flash.now[:errors] = @game.errors.messages.values.flatten
          #   render 'index'
          # end
        end
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

      private

      def game_params
        params.require(:game).permit(:gamename,:genre_id)
      end
    

    def set_game  
      @game = Game.find(params[:id])
    end
  end