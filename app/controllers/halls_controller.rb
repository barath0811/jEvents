class HallsController < ApplicationController
  # GET /halls
  # GET /halls.json
  def index
    @halls = Hall.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @halls }
    end
  end

  # GET /halls/1
  # GET /halls/1.json
  def show
    @hall = Hall.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hall }
    end
  end

  # GET /halls/new
  # GET /halls/new.json
  def new
    @hall = Hall.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hall }
    end
  end

  # GET /halls/1/edit
  def edit
    @hall = Hall.find(params[:id])
  end

  # POST /halls
  # POST /halls.json
  def create
    @hall = Hall.new(params[:hall])

    respond_to do |format|
      if @hall.save
        format.html { redirect_to @hall, notice: 'Hall was successfully created.' }
        format.json { render json: @hall, status: :created, location: @hall }
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
        format.html { redirect_to @hall, notice: 'Hall was successfully updated.' }
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
