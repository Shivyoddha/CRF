require "application_system_test_case"

class ActivitiesTest < ApplicationSystemTestCase
  setup do
    @activity = activities(:one)
  end

  test "visiting the index" do
    visit activities_url
    assert_selector "h1", text: "Activities"
  end

  test "creating a Activity" do
    visit activities_url
    click_on "New Activity"

    fill_in "End date", with: @activity.end_date
    fill_in "Name and guide", with: @activity.name_and_guide
    fill_in "No of attendees", with: @activity.no_of_attendees
    fill_in "Start date", with: @activity.start_date
    fill_in "Title", with: @activity.title
    fill_in "Type", with: @activity.type
    click_on "Create Activity"

    assert_text "Activity was successfully created"
    click_on "Back"
  end

  test "updating a Activity" do
    visit activities_url
    click_on "Edit", match: :first

    fill_in "End date", with: @activity.end_date
    fill_in "Name and guide", with: @activity.name_and_guide
    fill_in "No of attendees", with: @activity.no_of_attendees
    fill_in "Start date", with: @activity.start_date
    fill_in "Title", with: @activity.title
    fill_in "Type", with: @activity.type
    click_on "Update Activity"

    assert_text "Activity was successfully updated"
    click_on "Back"
  end

  test "destroying a Activity" do
    visit activities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Activity was successfully destroyed"
  end
end
