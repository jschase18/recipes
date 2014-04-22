class EntriesController < ApplicationController
	def new
		@entry = Entry.new
	end
	
	def show
		@entry = Entry.find(params[:id])
	end
	
	def create
		@entry = Entry.new(entry_params)
		
		print (:name);

		if @entry.save
			redirect_to @entry
		else
			render 'new'
		end
	end
	
	def index
		@entries = Entry.all
	end
	
	private
		def entry_params
			params.require(:entries).permit(:name, :description, :ingredients, :instructions)
		end
end
