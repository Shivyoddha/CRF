require "application_system_test_case"

class HrlcmsTest < ApplicationSystemTestCase
  setup do
    @hrlcm = hrlcms(:one)
  end

  test "visiting the index" do
    visit hrlcms_url
    assert_selector "h1", text: "Hrlcms"
  end

  test "should create hrlcm" do
    visit hrlcms_url
    click_on "New hrlcm"

    fill_in "Analysis", with: @hrlcm.analysis
    fill_in "Category", with: @hrlcm.category
    fill_in "Disposal", with: @hrlcm.disposal
    fill_in "Health", with: @hrlcm.health
    fill_in "Incompatible", with: @hrlcm.incompatible
    fill_in "More", with: @hrlcm.more
    fill_in "Nature sample", with: @hrlcm.nature_sample
    fill_in "Sample", with: @hrlcm.sample
    fill_in "Sample concentration", with: @hrlcm.sample_concentration
    fill_in "Sample contains", with: @hrlcm.sample_contains
    fill_in "Sample salts", with: @hrlcm.sample_salts
    fill_in "Sample type", with: @hrlcm.sample_type
    fill_in "Sample volume", with: @hrlcm.sample_volume
    fill_in "Solvent", with: @hrlcm.solvent
    fill_in "Storage", with: @hrlcm.storage
    fill_in "Testing required", with: @hrlcm.testing_required
    fill_in "Toxicity", with: @hrlcm.toxicity
    click_on "Create Hrlcm"

    assert_text "Hrlcm was successfully created"
    click_on "Back"
  end

  test "should update Hrlcm" do
    visit hrlcm_url(@hrlcm)
    click_on "Edit this hrlcm", match: :first

    fill_in "Analysis", with: @hrlcm.analysis
    fill_in "Category", with: @hrlcm.category
    fill_in "Disposal", with: @hrlcm.disposal
    fill_in "Health", with: @hrlcm.health
    fill_in "Incompatible", with: @hrlcm.incompatible
    fill_in "More", with: @hrlcm.more
    fill_in "Nature sample", with: @hrlcm.nature_sample
    fill_in "Sample", with: @hrlcm.sample
    fill_in "Sample concentration", with: @hrlcm.sample_concentration
    fill_in "Sample contains", with: @hrlcm.sample_contains
    fill_in "Sample salts", with: @hrlcm.sample_salts
    fill_in "Sample type", with: @hrlcm.sample_type
    fill_in "Sample volume", with: @hrlcm.sample_volume
    fill_in "Solvent", with: @hrlcm.solvent
    fill_in "Storage", with: @hrlcm.storage
    fill_in "Testing required", with: @hrlcm.testing_required
    fill_in "Toxicity", with: @hrlcm.toxicity
    click_on "Update Hrlcm"

    assert_text "Hrlcm was successfully updated"
    click_on "Back"
  end

  test "should destroy Hrlcm" do
    visit hrlcm_url(@hrlcm)
    click_on "Destroy this hrlcm", match: :first

    assert_text "Hrlcm was successfully destroyed"
  end
end
