class Api::V1::CharactersController < ApplicationController
  
    before_action :authorize_request, except: :create
    before_action :find_character, except: %i[create index]
    before_action :order_params


    has_scope :by_name
    has_scope :by_age, using: [:from, :to]
    has_scope :by_weight, using: [:from, :to]
    has_scope :by_movie

    # GET /characters
    def index
      @characters = (apply_scopes(Character.order(created_at: @order)))
      render json: CharactersRepresenter.new(@characters).as_json
    end
  
    # GET /characters/{name}
    def show
      render json: CharacterRepresenter.new(@character).as_json
    end

    # POST /characters
    def create
      @character = Character.new(character_params)
      if @character.save
        render json: @character, status: :created
      else
        render json: { errors: @character },
               status: :unprocessable_entity
      end
    end
  
    # PUT /characters/{name}
    def update
      if @character.update(character_params)
          render json: CharacterRepresenter.new(@character).as_json
      else
          render json: @character.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /users/{name}
    def destroy
      @character.destroy
      render json: { message: @character.name + ' was Deleted' }
    end

    private
  
    def find_character
        @character = Character.find_by_name!(params[:_name])
        rescue ActiveRecord::RecordNotFound
            render json: { errors: 'Character not found' }, status: :not_found
    end
  
    def character_params
        params.permit(
            :image, :name, :age, :weight, :storie, {:movie_ids => []}
        )
    end

    def order_params
      @order = params.fetch(:order, "asc")  
    end
end
