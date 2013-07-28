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
      @rating_count = Rating.getCount(@venue.id)
      @rating_average = Rating.getAverage(@venue.id, @rating_count)
      

      respond_to do |format|
        if @rating.save
          @venue.update_attributes(:rating =>  @rating_average, :rating_count =>  @rating_count)
          format.js
        end
     end
   end
end