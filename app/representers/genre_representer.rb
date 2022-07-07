class GenreRepresenter
    def initialize(genre)
        @genre = genre
    end

    def as_json
        {
            id: genre.id,
            name: genre.name,
            genre_movies:
            begin
                genre.movies.map do |movie|
                    {
                    movie_id: movie.id,
                    movie_title: movie.title,
                    movie_image: movie.image
                }
                end
            end
        }
    end
    private
    attr_reader :genre
end