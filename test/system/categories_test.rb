require "application_system_test_case"

class CategoriesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  test "visiting the sign-in page" do
    visit root_path
    assert_current_path(new_user_session_path)
  end

  test "creating a new category" do
    user = users(:one)
    sign_in user

    visit root_path

    assert_text "HOORAY, NO TASK FOR TODAY!"
    assert_text "CREATE TASK NOW"

    link = find_link("Create Task Now", class: "category-add-button")
    link.click
    assert_current_path new_category_path

    category = Category.new(title: "Vacation", description: "Sample Description")
    category.user = user

    fill_in "category_title", with: category.title
    fill_in "category_description", with: category.description
    click_button "Submit"

    assert_text "Category created successfully"
    assert_text category.title.upcase
  end
end
