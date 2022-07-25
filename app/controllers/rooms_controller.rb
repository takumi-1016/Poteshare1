class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:show,:index,:post]
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
  #ルーム検索用ページ
  def post
    @rooms = Room.all
    @q = Room.ransack(params[:q])
    @results = @q.result
    @number = @rooms.count
  end
  
  private
  def room_params
    params.require(:room).permit(:room_name, :room_introduction, :room_price, :room_address, :room_image, :user_id)
  end
  
end
