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


    fill_in "Title", with: "Create a Journal App"
    fill_in "Description", with: "List down all the tasks."
    click_button "Submit"

    assert_text "Category created successfully"
    assert_text "Create a Journal App".upcase
  end
end
