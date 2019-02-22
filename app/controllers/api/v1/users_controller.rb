class Api::V1::UsersController < ApplicationController
  before_action :find_user, only:[:show, :update, :destroy]

  def index
    @users = User.all
    render json: @users
  end

  def show  
  end

  def create
    @user = User.create
    if @user.save
      render json: @user 
    else
      render json: {errors: @user.errors.full_messages}
    end
  end

  def update
    @user.update(user_params)
    render json: @user
  end

  def destroy
    @users = User.all
    @user.destroy
    render json: @users
  end

  private
  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:first_name, :last_name, :birthday, :pw_digest, :email)
  end
end
