class Admin::ShowcasesController < ApplicationController

	def index
		@showcases = Showcase.all
		current = @showcases.collect(&:ord)

		i = 1;
		until i > Showcase.maxcount do
			@showcases << Showcase.new(ord: i, venue_id: -1) unless current.include? i
			i = i+1
		end

		@venues = Array.new
		@venues << [-1, "Select a venue"]
		Venue.select([:id, :name]).each do |venue|
			@venues << [venue.id, venue.name]
		end

		respond_to do |format|
			format.js
		end
	end

	def update
		order = params[:id]
		venueid = params[:showcase][:venue_id]

		# If venue selection remove, delete the entry in database.
		if venueid == "-1"
			Showcase.delete_all(:ord => order)

			respond_to do |format|
				format.json { respond_with_bip(Showcase.new) and return}
			end
		end

		@showcases = Showcase.where(:ord => order)

		# If no entry in db for this order, create a new one, set venue id and return
		if @showcases.empty?
			@showcase = Showcase.new(:ord => order, :venue_id => venueid)
			respond_to do |format|
				if @showcase.save
					format.json { respond_with_bip(@showcase) and return }
				end
			end
		end

		# If there is an entry in db, update it and return
		respond_to do |format|
			if @showcases.update_all(:venue_id => venueid)
				format.json { respond_with_bip(Showcase.where(:ord => order).first) }
			end
		end
	end
end
