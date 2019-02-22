class Api::V1::DesignsController < ApplicationController
  before_action :find_design, only:[:show, :update, :destroy]

  def index
    @designs = Design.all
    render json: @designs
  end

  def show
  end

  def create
    @design = Design.create(design_params)
    if @design.save
      render json: @design
    else
      render json: {errors: @design.errors.full_messages}
    end
  end

  def update  
    @design.update(design_params)
    render json: @design   
  end

  def destroy
    @designs = Design.all
    @design.destroy
    render json: @designs
  end

  private
  def find_design
    @design = Design.find(params[:id])
  end

  def design_params
    params.permit(:title, :image, :user_id, :event_id)
  end
end
