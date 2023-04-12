require "application_system_test_case"

class FighterPhotosTest < ApplicationSystemTestCase
  setup do
    @fighter_photo = fighter_photos(:one)
  end

  test "visiting the index" do
    visit fighter_photos_url
    assert_selector "h1", text: "Fighter Photos"
  end

  test "creating a Fighter photo" do
    visit fighter_photos_url
    click_on "New Fighter Photo"

    click_on "Create Fighter photo"

    assert_text "Fighter photo was successfully created"
    click_on "Back"
  end

  test "updating a Fighter photo" do
    visit fighter_photos_url
    click_on "Edit", match: :first

    click_on "Update Fighter photo"

    assert_text "Fighter photo was successfully updated"
    click_on "Back"
  end

  test "destroying a Fighter photo" do
    visit fighter_photos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fighter photo was successfully destroyed"
  end
end
