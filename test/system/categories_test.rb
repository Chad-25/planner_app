require "application_system_test_case"

class CategoriesTest < ApplicationSystemTestCase
  test "creating a new category" do
    user = users(:one)

    category = Category.new(title: "Vacation", description: "Sample Description")
    category.user = user

    visit root_path
    click_link "New Category"

    fill_in "Title", with: category.title
    fill_in "Description", with: category.description
    click_button "Create Category"

    assert_text "Category was successfully created."
    assert_text category.title
    assert_text category.description
  end
end
