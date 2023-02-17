require "application_system_test_case"

class ThreeDNonContactsTest < ApplicationSystemTestCase
  setup do
    @three_d_non_contact = three_d_non_contacts(:one)
  end

  test "visiting the index" do
    visit three_d_non_contacts_url
    assert_selector "h1", text: "Three d non contacts"
  end

  test "should create three d non contact" do
    visit three_d_non_contacts_url
    click_on "New three d non contact"

    fill_in "Incompatible", with: @three_d_non_contact.incompatible
    fill_in "More", with: @three_d_non_contact.more
    fill_in "Range", with: @three_d_non_contact.range
    fill_in "Sample", with: @three_d_non_contact.sample
    fill_in "Scant", with: @three_d_non_contact.scant
    fill_in "Stepinterval", with: @three_d_non_contact.stepinterval
    fill_in "Toxicity", with: @three_d_non_contact.toxicity
    click_on "Create Three d non contact"

    assert_text "Three d non contact was successfully created"
    click_on "Back"
  end

  test "should update Three d non contact" do
    visit three_d_non_contact_url(@three_d_non_contact)
    click_on "Edit this three d non contact", match: :first

    fill_in "Incompatible", with: @three_d_non_contact.incompatible
    fill_in "More", with: @three_d_non_contact.more
    fill_in "Range", with: @three_d_non_contact.range
    fill_in "Sample", with: @three_d_non_contact.sample
    fill_in "Scant", with: @three_d_non_contact.scant
    fill_in "Stepinterval", with: @three_d_non_contact.stepinterval
    fill_in "Toxicity", with: @three_d_non_contact.toxicity
    click_on "Update Three d non contact"

    assert_text "Three d non contact was successfully updated"
    click_on "Back"
  end

  test "should destroy Three d non contact" do
    visit three_d_non_contact_url(@three_d_non_contact)
    click_on "Destroy this three d non contact", match: :first

    assert_text "Three d non contact was successfully destroyed"
  end
end
