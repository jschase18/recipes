require 'test_helper'

class EntriesControllerTest < ActionController::TestCase
	#test "the truth" do
	#	assert true
	#end
	
	setup :initialize_entry
	
	def teardown
		@entry = nil
	end
	
	test "should create entry" do
		assert_difference('Entry.count') do
			post :create, entries: {name: 'Testname', description: '1234567890', ingredients: '1234567890', instructions: '1234567890'}
		end
	
	assert_redirected_to entry_path(assigns(:entry))
	end
	
	test "should update entry" do
		patch :update, id: @entry.id, entries: {name: "newtestname"}
		assert_redirected_to entry_path(assigns(:entry))
	end
	
	test "should show entry" do
		get :show, id: @entry.id
		assert_response :success
	end
	
	test "should get index" do
		get :index
		assert_response :success
		assert_not_nil assigns(:entries)
	end
	
	test "should destroy entry" do
		assert_difference('Entry.count', -1) do
			delete :destroy, id: @entry.id
		end
	
	assert_redirected_to entries_path
	end
	
	test "should route to entry 1" do
		assert_routing '/entries/1', {controller: "entries", action: "show", id: "1"}
	end
	
	test "should route to entry 2" do
		assert_routing '/entries/2', {controller: "entries", action: "show", id: "2"}
	end
	
	test "should route to index" do
		assert_routing '/', {controller: "entries", action: "index"}
	end
	
	test "should route to new" do
		assert_routing '/entries/new', {controller: "entries", action: "new"}
	end
	
	test "should route to edit 1" do
		assert_routing '/entries/1/edit', {controller: "entries", action: "edit", id:"1"}
	end
	
	private
		def initialize_entry
			@entry = entries(:one)
		end
end
