class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]
  before_action :find_user, only:[:show, :update, :destroy]

  def index
    @users = User.all
    render json: @users
  end

  def profile
    render json: { user: UserSerializer.new(current_user)}, status: :accepted
  end

  def show  
    render json: @user
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token(user_id: @user)
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created 
    else
      render json: {error: 'failed to create user'}, status: :not_acceptable
    end
  end

  def update
    if @user.valid?
      @user.update(user_params)
      render json: {user: @user}
    else 
      render json: {error: 'failed to update user information'}, status: :not_acceptable
    end
  end

  def destroy
    @users = User.all
    @user.destroy
    render json: {message: "Goodbye!"}
  end

  private
  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :birthday, :password, :email)
  end
end
