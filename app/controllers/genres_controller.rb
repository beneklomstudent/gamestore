class GenresController < ApplicationController
    def create
        @genre = genre.new(genre_params)
        begin
            @genre.save!
            redirect_to @genre
        end

        def genre_params
            params.require(:genre)   

end
