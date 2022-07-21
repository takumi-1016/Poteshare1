class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @user = current_user
    @room = Room.find(params[:reservation][:room_id])
    if @reservation.save
      redirect_to root_path, notice:"予約が完了しました。"
    else
      render "confirm"
    end
  end

  def confirm
    binding.pry
    @reservation = Reservation.new(reservation_params)
    binding.pry
    @room = Room.find(params[:room_id])
    binding.pry
    @days = 2
    @price = 2
  end

  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :people_number).merge(user_id: current_user.id, room_id: params[:room_id] )
  end
  
end
