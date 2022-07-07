class MovieRepresenter 
    def initialize(movie)
        @movie = movie
    end

    def as_json
        {
            id: movie.id,
            image: movie.image,
            title: movie.title,
            release_date: movie.release_date,
            rating: movie.rating,
            characters:
            begin
                movie.characters.map do |character|
                    character.name
                end
            end
            # genres:
            # begin
            #     movie.genres.map do |genre|
            #         genre.name
            #     end
            # end  
        }
    end

    private
    attr_reader :movie
end