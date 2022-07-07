class Api::V1::MoviesController < ApplicationController
    before_action :authorize_request, except: :create
    before_action :find_movies, except: %i[create index]
    before_action :order_params

    has_scope :by_title 
    has_scope :by_genre

    # GET /movies
    def index
      @movies = (apply_scopes(Movie.order(created_at: @order)))
      render json: MoviesRepresenter.new(@movies).as_json
    end
  
    # GET /movies/{title}
    def show
        render json: MovieRepresenter.new(@movies).as_json
    end


    # POST /movies
    def create
      @movie = Movie.new(movie_params)
      if @movie.save
        render json: @movie, status: :created
      else
        render json: { errors: @movie.errors.full_messages },
               status: :unprocessable_entity
      end
    end
  
    # PUT /movies/{title}
    def update
      if @movie.update(movie_params)
          render json: MovieRepresenter.new(@movie).as_json
      else
          render json: @movie.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /users/{title}
    def destroy
      @movie.destroy
        render json: { message: @movie.title + ' was Deleted' }
    end

    private
  
    def find_movies
        @movie = Movie.find_by_title!(params[:_title])
        rescue ActiveRecord::RecordNotFound
            render json: { errors: 'Movies not found' }, status: :not_found
    end
  
    def movie_params
        params.permit(
            :image, :title, :release_date, :rating, {:character_ids => []}
        )
    end

    def order_params
      @order = params.fetch(:order, "asc") 
    end
end
