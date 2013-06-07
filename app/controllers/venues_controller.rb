class VenuesController < ApplicationController
  # GET /venues
  # GET /venues.json
  def index
    @venues = Venue.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @venues }
    end
  end

  # GET /venues/1
  # GET /venues/1.json
  def show
    @venue = Venue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @venue }
    end
  end

  def show_basic
    @venue = Venue.new
    @venue.build_address
    @venue.build_contact

    respond_to do |format|
      format.js   #show_basic.js.erb
    end
  end

  def show_halls
    @venue = Venue.new
    @venue.halls.build

    respond_to do |format|
      format.js   #show_basic.js.erb
    end
  end

  def show_pricing
    @venue = Venue.new
    @venue.build_rate

    respond_to do |format|
      format.js   #show_basic.js.erb
    end
  end

  def show_amenities
    @venue = Venue.new
    @venue.build_facility

    respond_to do |format|
      format.js   #show_basic.js.erb
    end
  end

  def show_settings
    @venue = Venue.new

    respond_to do |format|
      format.js   #show_basic.js.erb
    end
  end

  def search
    query = SearchCriteria.new
    unless params[:eventType].nil?
      query.eventType = params[:eventType]
    end

    unless params[:areas].nil?
      query.areas = params[:areas]
    end

    unless params[:areas].nil?
      query.areas = params[:areas]
    end

    unless params[:budget].nil?
      query.areas = params[:budget]
    end

    unless params[:amenities].nil?
      query.areas = params[:amenities]
    end

    unless params[:capacities].nil?
      query.areas = params[:capacities]
    end

    unless params[:meal].nil?
      query.areas = params[:meal]
    end

    @venue = Venue.search(query)
  end

  # GET /venues/new
  # GET /venues/new.json
  def new
    @venue = Venue.new
    @venue.build_address
    @venue.build_contact

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @venue }
    end
  end

  # GET /venues/1/edit
  def edit
    @venue = Venue.find(params[:id])
  end

  # POST /venues
  # POST /venues.json
  def create
    @venue = Venue.new(params[:venue])

    respond_to do |format|
      if @venue.save
        format.html { redirect_to @venue, notice: 'Venue was successfully created.' }
        format.json { render json: @venue, status: :created, location: @venue }
      else
        format.html { render action: "new" }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /venues/1
  # PUT /venues/1.json
  def update
    @venue = Venue.find(params[:id])

    respond_to do |format|
      if @venue.update_attributes(params[:venue])
        format.html { redirect_to @venue, notice: 'Venue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /venues/1
  # DELETE /venues/1.json
  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy

    respond_to do |format|
      format.html { redirect_to venues_url }
      format.json { head :no_content }
    end
  end
end
