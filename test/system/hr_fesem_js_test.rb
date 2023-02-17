require "application_system_test_case"

class HrFesemJsTest < ApplicationSystemTestCase
  setup do
    @hr_fesem_j = hr_fesem_js(:one)
  end

  test "visiting the index" do
    visit hr_fesem_js_url
    assert_selector "h1", text: "Hr fesem js"
  end

  test "should create hr fesem j" do
    visit hr_fesem_js_url
    click_on "New hr fesem j"

    fill_in "Composition", with: @hr_fesem_j.composition
    fill_in "Conducting", with: @hr_fesem_j.conducting
    fill_in "Eds required", with: @hr_fesem_j.eds_required
    fill_in "Measurement", with: @hr_fesem_j.measurement
    fill_in "More", with: @hr_fesem_j.more
    fill_in "Sample", with: @hr_fesem_j.sample
    fill_in "Sphase", with: @hr_fesem_j.sphase
    fill_in "Stype", with: @hr_fesem_j.stype
    fill_in "Toxic", with: @hr_fesem_j.toxic
    click_on "Create Hr fesem j"

    assert_text "Hr fesem j was successfully created"
    click_on "Back"
  end

  test "should update Hr fesem j" do
    visit hr_fesem_j_url(@hr_fesem_j)
    click_on "Edit this hr fesem j", match: :first

    fill_in "Composition", with: @hr_fesem_j.composition
    fill_in "Conducting", with: @hr_fesem_j.conducting
    fill_in "Eds required", with: @hr_fesem_j.eds_required
    fill_in "Measurement", with: @hr_fesem_j.measurement
    fill_in "More", with: @hr_fesem_j.more
    fill_in "Sample", with: @hr_fesem_j.sample
    fill_in "Sphase", with: @hr_fesem_j.sphase
    fill_in "Stype", with: @hr_fesem_j.stype
    fill_in "Toxic", with: @hr_fesem_j.toxic
    click_on "Update Hr fesem j"

    assert_text "Hr fesem j was successfully updated"
    click_on "Back"
  end

  test "should destroy Hr fesem j" do
    visit hr_fesem_j_url(@hr_fesem_j)
    click_on "Destroy this hr fesem j", match: :first

    assert_text "Hr fesem j was successfully destroyed"
  end
end
