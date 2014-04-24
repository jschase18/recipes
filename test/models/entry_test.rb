require 'test_helper'

# Various tests on the recipe (entry) model. Mostly testing the model to ensure proper validation functionality


class EntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
	test "should not save without name" do
		entry = Entry.new
		assert_not entry.save, "Saved the entry without a name"
	end
	
	test "Should not save without a description"do
		entry = Entry.new
		entry.name = "TestName"
		entry.instructions = "Testing123456789"
		entry.ingredients = "Testing123456789"
		assert_not entry.save, "Saved the entry without a description"
	end
	
	test "Should not save with a <10 character description"do
		entry = Entry.new
		entry.name = "TestName"
		entry.description = "Nope"
		entry.instructions = "Testing123456789"
		entry.ingredients = "Testing123456789"
		assert_not entry.save, "Saved the entry with a short description"
	end
	
	test "Should not save with a <10 character ingredients"do
		entry = Entry.new
		entry.name = "TestName"
		entry.description = "Testing123456789"
		entry.instructions = "Testing123456789"
		entry.ingredients = "Nope"
		assert_not entry.save, "Saved the entry with a short ingredients"
	end
	
	test "Should not save with a <10 character instructions"do
		entry = Entry.new
		entry.name = "TestName"
		entry.description = "Testing123456789"
		entry.instructions = "Nope"
		entry.ingredients = "Testing123456789"
		assert_not entry.save, "Saved the entry with a short instructions"
	end
	
	test "should save properly" do
		entry = entries(:one)
		assert entry.save, "Did not save the recipe"
	end
	
	test "should not save properly" do
		entry = entries(:two)
		assert_not entry.save, "Saved the invalid recipe"
	end
  
end
