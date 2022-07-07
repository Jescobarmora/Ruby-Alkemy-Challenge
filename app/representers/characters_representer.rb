class CharactersRepresenter

    def initialize(characters)
        @characters = characters
    end

    def as_json
        @characters.map do |character|
            {
                id: character.id,
                image: character.image,
                name: character.name
            }
        end
    end

    private
    attr_reader :characters
end