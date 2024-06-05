require "application_system_test_case"

class Training1sTest < ApplicationSystemTestCase
  setup do
    @training1 = training1s(:one)
  end

  test "visiting the index" do
    visit training1s_url
    assert_selector "h1", text: "Training1s"
  end

  test "creating a Training1" do
    visit training1s_url
    click_on "New Training1"

    click_on "Create Training1"

    assert_text "Training1 was successfully created"
    click_on "Back"
  end

  test "updating a Training1" do
    visit training1s_url
    click_on "Edit", match: :first

    click_on "Update Training1"

    assert_text "Training1 was successfully updated"
    click_on "Back"
  end

  test "destroying a Training1" do
    visit training1s_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Training1 was successfully destroyed"
  end
end
