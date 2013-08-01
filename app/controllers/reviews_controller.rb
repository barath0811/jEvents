class ReviewsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  

  before_filter :get_venue

  def get_venue
    @venue = Venue.find(params[:venue_id])
  end


  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = @venue.reviews.all
    @review = Review.new

    respond_to do |format|
      format.js # index.js.erb
    end
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @review = Review.find(params[:id])

    respond_to do |format|
      format.js # show.js.erb
    end
  end

  # GET /reviews/new
  # GET /reviews/new.json
  def new
    @review = Review.new

    respond_to do |format|
      format.js # new.js.erb
    end
  end

  # GET /reviews/1/edit
  def edit
    @review = Review.find(params[:id])
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(params[:review])
    @review.venue_id = @venue.id
    @review.user_id = current_user.id

    respond_to do |format|
      if @review.save
        format.js 
      else
        format.html { render action: "new" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reviews/1
  # PUT /reviews/1.json
  def update
    @review = Review.find(params[:id])

    respond_to do |format|
      if @review.update_attributes(params[:review])
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    respond_to do |format|
      format.js
    end
  end
end
