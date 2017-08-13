class PagesController < ApplicationController
  def home
    @rooms = Room.where(active: true).limit(3)
  end

  def search
    # step 1
    if params[:search].present? && params[:search].strip != ""
      session[:loc_search] = params[:search]
    end

    # step 2
    if session[:loc_search] && session[:loc_search] != ""
      begin
        @rooms_address = Room.where(active: true).near(session[:loc_search], 15)
      rescue
        @rooms_address = Room.where(active: true).all
        flash[:alert] = "Location #{session[:loc_search]} not found"
      end
    else
      @rooms_address = Room.where(active: true).all
    end

    # step 3
    @search = @rooms_address.ransack(params[:q])
    @rooms  = @search.result

    @arrRooms = @rooms.to_a

    if (params[:start_date]) && params[:end_date] && !params[:start_date].empty? && !params[:end_date].empty?
      
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])

      @arrRooms.each do |room|

        not_availble = room.reservations.where(
          "(? <= start_date AND start_date <= ?)
          OR (? <= end_date AND end_date <= ?)
          OR (start_date < ? AND ? < end_date)",
          start_date, end_date,
          start_date, end_date,
          start_date, end_date
        ).limit(1),

        if not_availble && not_availble.length > 0
          @arrRooms.delete(room)
        end

      end
      
    end

  end
end
