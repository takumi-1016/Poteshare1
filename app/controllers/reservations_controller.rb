class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def create
    @room = Room.find(params[:reservation][:room_id])
    @user = current_user
    @reservation = Reservation.new(reservation_params)
    binding.pry
    if @reservation.save!
      redirect_to root_path, notice:"予約が完了しました。"
    else
      render "confirm"
    end
  end

  def confirm
    
    @reservation = Reservation.new(confirm_reservation_params)
    
    @room = Room.find(params[:reservation][:room_id])
    binding.pry
    @days = (@reservation.end_date - @reservation.start_date).to_i
    @price = @days * @room.room_price * @reservation.people_number
    binding.pry
  end

  private
  def confirm_reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :people_number, :user_id, :room_id).merge(user_id: current_user.id)
  end
  
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :people_number, :user_id, :room_id, :reservation_price).merge(user_id: current_user.id )
  end
  
end
