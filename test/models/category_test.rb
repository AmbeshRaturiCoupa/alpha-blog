require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
    def setup
        @category=Category.new(name: "Sports")

    end
    test "category should be valid" do
        assert @category.valid?
    end

    test "name should be present" do
        @category.name= ""
        assert_not @category.valid?
    end

    test "name should be unique" do
        @category.save
        @category1=Category.new(name: "Sports")
        @category1.save
        assert_not @category1.valid?

    end

    test "name should not be too long" do
        @category.name = "a"*26
        assert_not @category.valid?
    end

    test "name should not be too short" do
         @category.name = "a"*4
        assert_not @category.valid?
    end
end