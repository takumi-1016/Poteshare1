class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path, notice:"宿を登録しました。"
    else
      flash[:alert] = "必須項目に入力してください"
      render "new"
    end

  end

  def show
    @room = Room.find(params[:id])
    @user = @room.user
    
  
    
    @reservation = Reservation.new

  end
  
  private
  def room_params
    params.require(:room).permit(:room_name, :room_introduction, :room_price, :room_address, :room_image, :user_id)
  end
  
end
