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
	
	#test "should update post"
	
	#test "should destroy entry" do
	#	assert_difference('Entry.count', -1) do
	#		delete :destroy, id: @entry.id
	#	end
	#
	#assert_redirected_to entries_path
	#end
	
	test "should show entry" do
		get :show, id: @entry.id
		assert_response :success
	end
	
	test "should get index" do
		get :index
		assert_response :success
		assert_not_nil assigns(:entries)
	end
	
	private
		def initialize_entry
			@entry = entries(:one)
		end
end
