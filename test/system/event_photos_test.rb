require "application_system_test_case"

class EventPhotosTest < ApplicationSystemTestCase
  setup do
    @event_photo = event_photos(:one)
  end

  test "visiting the index" do
    visit event_photos_url
    assert_selector "h1", text: "Event Photos"
  end

  test "creating a Event photo" do
    visit event_photos_url
    click_on "New Event Photo"

    click_on "Create Event photo"

    assert_text "Event photo was successfully created"
    click_on "Back"
  end

  test "updating a Event photo" do
    visit event_photos_url
    click_on "Edit", match: :first

    click_on "Update Event photo"

    assert_text "Event photo was successfully updated"
    click_on "Back"
  end

  test "destroying a Event photo" do
    visit event_photos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event photo was successfully destroyed"
  end
end
