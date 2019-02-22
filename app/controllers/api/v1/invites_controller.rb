class Api::V1::InvitesController < ApplicationController
  before_action :find_invite, only:[:show, :update, :destroy]
  def index
    @invites = Invite.all
    render json: @invites
  end

  def show
  end

  def create
    @invite = Invite.create(invite_params)
    if @invite.save
      render json:@invite
    else
      render json: {errors: @invite.errors.full_messages}
    end
  end

  def update
    @invite.update(invite_params)
    render json: @invite
  end

  def destroy
    @invites = Invite.all
    @invite.destroy
    render json: @invites
  end

  private
  def find_invite
    @invite = Invite.find(params[:id])
  end

  def invite_params
    params.permit(:name, :host, :date, :time, :phone_number, :location, :address, :message, :user_id, :design_id, :event_id)
  end
end
