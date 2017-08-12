class HostReviewsController < ApplicationController

  def create
    # check if the reservation exist?
    @reservation = Reservation.where(
                    id: host_review_params[:reservation_id],
                    room_id: host_review_params[:room_id],
                    user_id: host_review_params[:guest_id]
                   ).first
    if @reservation.nil?
      flash[:alert] = "Not Found this reservation"
      return
    end

    # check if the current host already reviewed the guest in this reservation.
    @has_reviewed = HostReview.where(
                      reservation_id: @reservation.id,
                      guest_id: host_review_params[:guest_id]
                    ).first
    if !@has_reviewed.nil?
      flash[:alert] = "Already reviewed!"
      return
    end

    @host_review = current_user.host_reviews.create(host_review_params)
    flash[:success] = "Review created..."
    redirect_back(fallback_location: request.referer)
  end

  def destroy
    @host_review = Review.find(params[:id])
    @host_review.destroy
    redirect_back(fallback_location: request.referer, notice: "Removed!")
  end

  private
    def host_review_params
      params.require(:host_review).permit(:comment, :star, :room_id, :reservation_id, :guest_id)
    end
end