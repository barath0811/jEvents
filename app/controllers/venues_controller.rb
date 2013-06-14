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

  # GET /venues/new
  # GET /venues/new.json
  def new
    @venue = Venue.new
    @venue.build_address
    @venue.build_contact

    respond_to do |format|
      format.html
      format.json { render json: @venue }
    end
  end

  def show_image
    @venue1 = Venue.find(params[:id])
    send_data @venue1.base_image, :type => 'image/png',:disposition => 'inline'
  end

  # POST /venues
  # POST /venues.json
  def create
    @venue = Venue.new(params[:venue])
    
    respond_to do |format|
      if @venue.save
        format.html { redirect_to :action => 'edit', :id => @venue.id }
        format.json { render json: @venue, status: :created, location: @venue }
      else
        format.html { render action: "new" }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /venues/1/edit
  def edit
    @venue = Venue.find(params[:id])

    respond_to do |format|
      format.html
      format.js   
    end
  end

  def edit_pricing
    @venue = Venue.find(params[:id])
    if @venue.rate.blank?
      @venue.build_rate
    end

    respond_to do |format|
      format.js   
    end
  end

  def edit_amenities
    @venue = Venue.find(params[:id])
    if @venue.facility.blank?
      @venue.build_facility
    end

    respond_to do |format|
      format.js   
    end
  end

  def edit_settings
    @venue = Venue.new

    respond_to do |format|
      format.js   
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

  def search
    @query = SearchCriteria.new
    
    unless params[:eventType].nil?
      @query.eventType = params[:eventType]
    end

    unless params[:areas].nil?
      @query.areas = params[:areas].split(',')
    end

    unless params[:budget].nil?
      @query.budget = params[:budget].split(',')
    end

    unless params[:amenities_val].nil?
      @query.amenities_val = params[:amenities_val].split(',')
    end

    unless params[:amenities_name].nil?
      @query.amenities_name = params[:amenities_name].split(',')
    end

    unless params[:capacities].nil?
      @query.capacity = params[:capacities].split(',')
    end

    unless params[:meal].nil?
      @query.mealOptions = params[:meal].split(',')
    end

    @venue = Venue.search(@query)

    unless params[:po].nil?
      respond_to do |format|
        format.js 
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
