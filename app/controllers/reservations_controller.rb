class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def create
    room = Room.find(params[:room_id])
    if current_user == room.user
      flash[:alert] = "You cannot book your own poperty"
    else
      start_date = Date.parse(reservation_params[:start_date])
      end_date = Date.parse(reservation_params[:end_date])
      days = end_date - start_date

      @reservation = current_user.reservations.build(reservation_params)
      @reservation.room = room
      @reservation.price = room.price
      @reservation.total = room.price * days
      @reservation.save

      flash[:notice] = "Booked Successfully"
    end
      redirect_to room
  end

  def mytrips
    @trips = current_user.reservations.order(start_date: :asc)
  end

  def myreservations
    @rooms = current_user.rooms
  end

    private
      def reservation_params
        params.require(:reservation).permit(:start_date, :end_date)
      end

end