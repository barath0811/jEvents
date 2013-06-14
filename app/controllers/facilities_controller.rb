class FacilitiesController < ApplicationController

  before_filter :get_venue

  def get_venue
    @venue = Venue.find(params[:venue_id])
  end

  def edit
    if @venue.facility.blank?
      @facility = Facility.new
    else
      @facility = Facility.find(params[:id])
    end

    respond_to do |format|
      format.js
    end
  end

  def create
    @facility = Facility.new(params[:facility])
    @facility.venue_id = @venue.id

    respond_to do |format|
      if @facility.save
        format.html { redirect_to edit_venue_path(@venue) }
        format.json { render json: @facility, status: :created, location: @facility }
      else
        format.html { render action: "new" }
        format.json { render json: @facility.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @facility = Facility.find(params[:id])

    respond_to do |format|
      if @facility.update_attributes(params[:facility])
        format.html { redirect_to edit_venue_path(@venue) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @facility.errors, status: :unprocessable_entity }
      end
    end
  end

end
