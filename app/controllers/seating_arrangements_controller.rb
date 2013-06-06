class SeatingArrangementsController < ApplicationController
  # GET /seating_arrangements
  # GET /seating_arrangements.json
  def index
    @seating_arrangements = SeatingArrangement.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @seating_arrangements }
    end
  end

  # GET /seating_arrangements/1
  # GET /seating_arrangements/1.json
  def show
    @seating_arrangement = SeatingArrangement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @seating_arrangement }
    end
  end

  # GET /seating_arrangements/new
  # GET /seating_arrangements/new.json
  def new
    @seating_arrangement = SeatingArrangement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @seating_arrangement }
    end
  end

  # GET /seating_arrangements/1/edit
  def edit
    @seating_arrangement = SeatingArrangement.find(params[:id])
  end

  # POST /seating_arrangements
  # POST /seating_arrangements.json
  def create
    @seating_arrangement = SeatingArrangement.new(params[:seating_arrangement])

    respond_to do |format|
      if @seating_arrangement.save
        format.html { redirect_to @seating_arrangement, notice: 'Seating arrangement was successfully created.' }
        format.json { render json: @seating_arrangement, status: :created, location: @seating_arrangement }
      else
        format.html { render action: "new" }
        format.json { render json: @seating_arrangement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /seating_arrangements/1
  # PUT /seating_arrangements/1.json
  def update
    @seating_arrangement = SeatingArrangement.find(params[:id])

    respond_to do |format|
      if @seating_arrangement.update_attributes(params[:seating_arrangement])
        format.html { redirect_to @seating_arrangement, notice: 'Seating arrangement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @seating_arrangement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seating_arrangements/1
  # DELETE /seating_arrangements/1.json
  def destroy
    @seating_arrangement = SeatingArrangement.find(params[:id])
    @seating_arrangement.destroy

    respond_to do |format|
      format.html { redirect_to seating_arrangements_url }
      format.json { head :no_content }
    end
  end
end
