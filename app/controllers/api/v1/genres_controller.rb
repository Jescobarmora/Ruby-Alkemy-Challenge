class Api::V1::GenresController < ApplicationController

    before_action :authorize_request, except: :create
    before_action :find_genre, except: %i[create index]

    has_scope :by_name

    # GET /genres
    def index
        @genres = apply_scopes(Genre.all)

        render json: GenresRepresenter.new(@genres).as_json
    end

    def show
        render json: GenreRepresenter.new(@genre).as_json
    end

    # POST /genres
    def create
        @genre = Genre.new(genre_params)

        if @genre.save
        render json: GenreRepresenter.new(@genre).as_json, status: :created
        else
        render json: @genre.errors, status: :unprocessable_entity
        end
    end

    # PUT /genres/{name}
    def update
        if @genre.update(genre_params)
            render json: GenreRepresenter.new(@genre).as_json
        else
            render json: @genre.errors, status: :unprocessable_entity
        end
    end

      # DELETE /genres/1
    def destroy
        @genre.destroy
        render json: { message: @character.name + ' was Deleted' }
    end


    private

        def find_genre
            @genre = Genre.find_by_name!(params[:_name])
            rescue ActiveRecord::RecordNotFound
                render json: { errors: 'Genre not found' }, status: :not_found
        end

        def genre_params
            params.permit(:name, :image, {:movie_ids => []})
        end
end

