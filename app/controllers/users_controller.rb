class UsersController < ApplicationController
    before_action :authorize_request, except: :create
    before_action :find_user, except: %i[create index]
    require 'sendgrid-ruby'
    include SendGrid
  
    # GET /users
    def index
      @users = User.all
      render json: @users, status: :ok
    end
  
    # GET /users/{username}s
    def show
      render json: @user, status: :ok
    end
  
    # POST /users
    def create
      @user = User.new(user_params)
      if @user.save

        from = Email.new(email: 'welcomerubychallenge@gmail.com')
        to = Email.new(email: User.last.email)
        subject = 'Welcome Email'
        content = Content.new(type: 'text/plain', value: 'Welcome Email Ruby Alkemy Challenge')
        mail = Mail.new(from, subject, to, content)

        sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
        response = sg.client.mail._('send').post(request_body: mail.to_json)
        
        puts response.status_code
        puts response.body
        puts response.headers

        render json: @user, status: :created
      else
        render json: { errors: @user.errors.full_messages },
               status: :unprocessable_entity
      end
    end
  
    # PUT /users/{username}
    def update
      unless @user.update(user_params)
        render json: { errors: @user.errors.full_messages },
               status: :unprocessable_entity
      end
    end
  
    # DELETE /users/{username}
    def destroy
      @user.destroy
    end
  
    private
  
    def find_user
      @user = User.find_by_username!(params[:_username])
      rescue ActiveRecord::RecordNotFound
        render json: { errors: 'User not found' }, status: :not_found
    end
  
    def user_params
      params.permit(
        :name, :username, :email, :password, :password_confirmation
      )
    end
  end