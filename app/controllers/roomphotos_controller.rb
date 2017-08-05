class RoomphotosController < ApplicationController
  def create
    @room = Room.find(params[:room_id])

    if params[:images]
      params[:images].each do |img|
        @room.roomphotos.create(image: img)
      end
      redirect_back(fallback_location: request.referer, notice: "Saved...")
    end
    @roomphotos = @room.roomphotos

  end

  def destroy
    @photo = Roomphoto.find(params[:id])
    room   = @photo.room

    @photo.destroy
    @photos = Roomphoto.where(room_id: room.id)

    respond_to :js
  end
end