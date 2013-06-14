class HallsController < ApplicationController

  before_filter :get_venue

  def get_venue
    @venue = Venue.find(params[:venue_id])
  end

  # GET /halls
  # GET /halls.json
  def index
    @halls = @venue.halls.all
    @hall = Hall.new  # ???
    
    respond_to do |format|
      format.js
    end
  end

  # GET /halls/1
  # GET /halls/1.json
  def show
    @hall = Hall.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: [@venue, @hall] }
    end
  end

  # GET /halls/new
  # GET /halls/new.json
  def new
    @hall = Hall.new
    
    respond_to do |format|
      format.js
    end
  end

  # GET /halls/1/edit
  def edit
    @hall = Hall.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  # POST /halls
  # POST /halls.json
  def create
    @hall = Hall.new(params[:hall])
    @hall.venue_id = @venue.id

    respond_to do |format|
      if @hall.save
        format.html { redirect_to edit_venue_path(@venue) }
        format.json { render json: [@venue, @hall], status: :created, location: @hall } #To BE UPDATED
      else
        format.html { render action: "new" }
        format.json { render json: @hall.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /halls/1
  # PUT /halls/1.json
  def update
    @hall = Hall.find(params[:id])

    respond_to do |format|
      if @hall.update_attributes(params[:hall])
        format.html { redirect_to edit_venue_path(@venue) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hall.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /halls/1
  # DELETE /halls/1.json
  def destroy
    @hall = Hall.find(params[:id])
    @hall.destroy

    respond_to do |format|
      format.html { redirect_to halls_url }
      format.json { head :no_content }
    end
  end
end
