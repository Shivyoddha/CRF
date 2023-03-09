require "application_system_test_case"

class AnsiesTest < ApplicationSystemTestCase
  setup do
    @ansy = ansies(:one)
  end

  test "visiting the index" do
    visit ansies_url
    assert_selector "h1", text: "Ansies"
  end

  test "creating a Ansy" do
    visit ansies_url
    click_on "New Ansy"

    fill_in "Amount", with: @ansy.amount
    fill_in "Debit", with: @ansy.debit
    fill_in "Purpose", with: @ansy.purpose
    fill_in "Slotdate", with: @ansy.slotdate
    fill_in "Sysno", with: @ansy.sysno
    click_on "Create Ansy"

    assert_text "Ansy was successfully created"
    click_on "Back"
  end

  test "updating a Ansy" do
    visit ansies_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @ansy.amount
    fill_in "Debit", with: @ansy.debit
    fill_in "Purpose", with: @ansy.purpose
    fill_in "Slotdate", with: @ansy.slotdate
    fill_in "Sysno", with: @ansy.sysno
    click_on "Update Ansy"

    assert_text "Ansy was successfully updated"
    click_on "Back"
  end

  test "destroying a Ansy" do
    visit ansies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ansy was successfully destroyed"
  end
end
