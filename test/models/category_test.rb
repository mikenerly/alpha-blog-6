require 'test_helper' #this will be gonna for all our test files

#write the class, that define our category model test file
class CategoryTest < ActiveSupport::TestCase
    
    def setup #this method does, whatever we pass here will run before any test run
        @category = Category.new(name: "Sports")
    end
    #Come up with some tes
    test "category should be valid" do
        assert @category.valid?
    end
    
    test "category name should present" do
        @category.name = " "
        assert_not @category.valid?
    end
    
    test "name should be unique" do
        @category.save #this will take our category instance variable with the name of sport and save it to the DATABASE
        @category2 = Category.new(name: "Sports")
        assert_not @category2.valid?
    end
    
    test "name should not be too long" do
        @category.name = "a" * 26
        assert_not @category.valid?
    end
    
    test "name should not be too short" do
       @category.name = "aa"
       assert_not @category.valid?
    end
    
end 