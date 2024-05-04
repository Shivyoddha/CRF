require "application_system_test_case"

class Training3sTest < ApplicationSystemTestCase
  setup do
    @training3 = training3s(:one)
  end

  test "visiting the index" do
    visit training3s_url
    assert_selector "h1", text: "Training3s"
  end

  test "creating a Training3" do
    visit training3s_url
    click_on "New Training3"

    click_on "Create Training3"

    assert_text "Training3 was successfully created"
    click_on "Back"
  end

  test "updating a Training3" do
    visit training3s_url
    click_on "Edit", match: :first

    click_on "Update Training3"

    assert_text "Training3 was successfully updated"
    click_on "Back"
  end

  test "destroying a Training3" do
    visit training3s_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Training3 was successfully destroyed"
  end
end
