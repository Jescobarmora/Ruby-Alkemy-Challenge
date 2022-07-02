class Api::V1::CharactersController < ApplicationController
    before_action :authorize_request, except: :create
    before_action :find_character, except: %i[create index]
  
    # GET /characters
    def index
      @characters = Character.all
      render json: @characters
    end
  
    # GET /characters/{name}
    def show
      render json: @character, status: :ok
    end

    
  
    # POST /characters
    def create
      @character = Character.new(character_params)
      if @character.save
        render json: @character, status: :created
      else
        render json: { errors: @character.errors.full_messages },
               status: :unprocessable_entity
      end
    end
  
    # PUT /characters/{name}
    def update
      unless @character.update(character_params)
        render json: { errors: @character.errors.full_messages },
               status: :unprocessable_entity
      else 
        render json: { message: @character.name + ' was Updated' }
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
            :image, :name, :age, :weight, :storie
        )
    end
end
