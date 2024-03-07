require "test_helper"

class CategoryTest < ActiveSupport::TestCase

  def setup
    @user = users(:one)
    @user_new = users(:two)

    @category = Category.new(title: "Vacation", description: "Sample Description")
    @category.user = @user

    @category_new = Category.new(title: "Vacation", description: "Sample Description")
    @category_new.user = @user_new

    @category_one = Category.new(title: "Vacation", description: "Sample Description")
    @category_one.user = @user
  end

  test "should be valid" do
    assert @category.valid?
  end

  test "should be valid duplicate category with different user" do
    assert @category_new.valid?
  end

  test "should not be valid duplicate category with the same user" do
    assert @category_one.valid?, "Expected duplicate category with the same user to be invalid"
  end
end
