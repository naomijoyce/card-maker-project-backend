class Api::V1::UsersController < ApplicationController
  before_action :find_user, only:[:show, :update, :destroy]

  def index
    @users = User.all
    render json: @users
  end

  def show  
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      render json: { user: UserSerializer.new(@user) }, status: :created 
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
