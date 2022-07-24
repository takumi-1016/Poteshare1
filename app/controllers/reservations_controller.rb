class ReservationsController < ApplicationController
  before_action :authenticate_user!
  def index   
    @reservations = Reservation.all 
  end

  def create
    @room = Room.find(params[:reservation][:room_id])
    @user = current_user
    @reservation = Reservation.new(reservation_params)
    if @reservation.save!
      redirect_to root_path, notice:"予約が完了しました。"
    else
      render "confirm"
    end
  end

  def confirm
    if user_signed_in?
    else
      redirect_to root_path, alert:"ログイン後有効な操作です。"
    end
    @reservation = Reservation.new(confirm_reservation_params)
    @room = Room.find(params[:reservation][:room_id])
    @days = (@reservation.end_date - @reservation.start_date).to_i
    @price = @days * @room.room_price * @reservation.people_number
    if @days <= 0
        redirect_to @room, alert:"終了日は開始日より後にしてください"
      elsif @reservation.reservation_people <=0 
        redirect_to @room, alert:"正しい人数を入力してください"
    end
  end

  private
  def confirm_reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :people_number, :user_id, :room_id).merge(user_id: current_user.id)
  end
  
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :people_number, :user_id, :room_id, :reservation_price).merge(user_id: current_user.id )
  end
  
end
