class RatingsController < ApplicationController
  before_filter :get_venue

  def get_venue
    @venue = Venue.find(params[:venue_id])
  end

  def rate
      @rating = Rating.new
      @rating.rating = params[:rating].to_i
      @rating.venue_id = @venue.id
      @rating.user_id = current_user.id
      

      respond_to do |format|
        if @rating.save
          format.js
        end
     end
   end
end