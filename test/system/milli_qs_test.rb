require "application_system_test_case"

class MilliQsTest < ApplicationSystemTestCase
  setup do
    @milli_q = milli_qs(:one)
  end

  test "visiting the index" do
    visit milli_qs_url
    assert_selector "h1", text: "Milli Qs"
  end

  test "creating a Milli q" do
    visit milli_qs_url
    click_on "New Milli Q"

    fill_in "Debit", with: @milli_q.debit
    fill_in "More", with: @milli_q.more
    fill_in "Slotdate", with: @milli_q.slotdate
    fill_in "Slottime", with: @milli_q.slottime
    fill_in "Status", with: @milli_q.status
    fill_in "Typewater", with: @milli_q.typewater
    fill_in "Volumeone", with: @milli_q.volumeone
    fill_in "Volumetwo", with: @milli_q.volumetwo
    click_on "Create Milli q"

    assert_text "Milli q was successfully created"
    click_on "Back"
  end

  test "updating a Milli q" do
    visit milli_qs_url
    click_on "Edit", match: :first

    fill_in "Debit", with: @milli_q.debit
    fill_in "More", with: @milli_q.more
    fill_in "Slotdate", with: @milli_q.slotdate
    fill_in "Slottime", with: @milli_q.slottime
    fill_in "Status", with: @milli_q.status
    fill_in "Typewater", with: @milli_q.typewater
    fill_in "Volumeone", with: @milli_q.volumeone
    fill_in "Volumetwo", with: @milli_q.volumetwo
    click_on "Update Milli q"

    assert_text "Milli q was successfully updated"
    click_on "Back"
  end

  test "destroying a Milli q" do
    visit milli_qs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Milli q was successfully destroyed"
  end
end
