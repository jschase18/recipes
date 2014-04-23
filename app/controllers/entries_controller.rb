class EntriesController < ApplicationController

	# Allows a very basic authentication scheme.
	http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show, :new]

	# New function. Creates a new "Entry" instance
	def new
		@entry = Entry.new
	end
	
	# Shows the proper Entry that matches the id
	def show
		@entry = Entry.find(params[:id])
	end
	
	# Creates a new entry with the params it's sent
	def create
		@entry = Entry.new(entry_params)

		# If it went fine, redirect to its show page, otherwise go back to the new page
		if @entry.save
			redirect_to @entry
		else
			render 'new'
		end
	end

	# Loads the right entry for the edit page. DEPRECATED
	def edit 
		@entry = Entry.find(params[:id])
	end
	
	# Updates the entry based on the params it is sent
	def update
	  @entry = Entry.find(params[:id])
	 
	 # If everything is correct, go to show. Otherwise, go back to edit
	  if @entry.update(entry_params)
		redirect_to @entry
	  else
		render 'edit'
	  end
	end
	
	# Loads the "entries" variable with all current entries
	def index
		@entries = Entry.all
	end
	
	# Deletes an entry (with the right permissions)
	def destroy
	  @entry = Entry.find(params[:id])
	  @entry.destroy
	  redirect_to entries_path
	end
	
	private
		# Constrains the types and names of the params it's sent
		def entry_params
			params.require(:entries).permit(:name, :description, :ingredients, :instructions)
		end
end
