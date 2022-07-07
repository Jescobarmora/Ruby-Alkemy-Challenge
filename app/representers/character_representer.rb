class CharacterRepresenter
    def initialize(character)
        @character = character
    end

    def as_json
        {
            id: character.id,
            image: character.image,
            name: character.name,
            age: character.age,
            weight: character.weight,
            storie: character.storie,
            movies:
            begin
                character.movies.map do |movie|
                    movie.title
                end
            end
        }
    end

    private
    attr_reader :character
end