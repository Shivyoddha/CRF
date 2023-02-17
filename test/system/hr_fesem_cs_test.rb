require "application_system_test_case"

class HrFesemCsTest < ApplicationSystemTestCase
  setup do
    @hr_fesem_c = hr_fesem_cs(:one)
  end

  test "visiting the index" do
    visit hr_fesem_cs_url
    assert_selector "h1", text: "Hr fesem cs"
  end

  test "should create hr fesem c" do
    visit hr_fesem_cs_url
    click_on "New hr fesem c"

    fill_in "Composition", with: @hr_fesem_c.composition
    fill_in "Conducting", with: @hr_fesem_c.conducting
    fill_in "Eds required", with: @hr_fesem_c.eds_required
    fill_in "Measurement", with: @hr_fesem_c.measurement
    fill_in "More", with: @hr_fesem_c.more
    fill_in "Sample", with: @hr_fesem_c.sample
    fill_in "Sphase", with: @hr_fesem_c.sphase
    fill_in "Stype", with: @hr_fesem_c.stype
    fill_in "Toxic", with: @hr_fesem_c.toxic
    click_on "Create Hr fesem c"

    assert_text "Hr fesem c was successfully created"
    click_on "Back"
  end

  test "should update Hr fesem c" do
    visit hr_fesem_c_url(@hr_fesem_c)
    click_on "Edit this hr fesem c", match: :first

    fill_in "Composition", with: @hr_fesem_c.composition
    fill_in "Conducting", with: @hr_fesem_c.conducting
    fill_in "Eds required", with: @hr_fesem_c.eds_required
    fill_in "Measurement", with: @hr_fesem_c.measurement
    fill_in "More", with: @hr_fesem_c.more
    fill_in "Sample", with: @hr_fesem_c.sample
    fill_in "Sphase", with: @hr_fesem_c.sphase
    fill_in "Stype", with: @hr_fesem_c.stype
    fill_in "Toxic", with: @hr_fesem_c.toxic
    click_on "Update Hr fesem c"

    assert_text "Hr fesem c was successfully updated"
    click_on "Back"
  end

  test "should destroy Hr fesem c" do
    visit hr_fesem_c_url(@hr_fesem_c)
    click_on "Destroy this hr fesem c", match: :first

    assert_text "Hr fesem c was successfully destroyed"
  end
end
