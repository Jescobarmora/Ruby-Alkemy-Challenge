class GenresRepresenter
    def initialize(genres)
        @genres = genres
    end

    def as_json
        @genres.map do |genre|
            {
                genre_id: genre.id,
                genre_name: genre.name,
            }
        end
    end

    private
    attr_reader :genres
end