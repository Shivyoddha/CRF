require "application_system_test_case"

class ScratchIndentationsTest < ApplicationSystemTestCase
  setup do
    @scratch_indentation = scratch_indentations(:one)
  end

  test "visiting the index" do
    visit scratch_indentations_url
    assert_selector "h1", text: "Scratch indentations"
  end

  test "should create scratch indentation" do
    visit scratch_indentations_url
    click_on "New scratch indentation"

    fill_in "Analysis", with: @scratch_indentation.analysis
    fill_in "Constant load", with: @scratch_indentation.constant_load
    fill_in "Increment load", with: @scratch_indentation.increment_load
    fill_in "Measurement", with: @scratch_indentation.measurement
    fill_in "More", with: @scratch_indentation.more
    fill_in "Number indentation", with: @scratch_indentation.number_indentation
    fill_in "Progressive load", with: @scratch_indentation.progressive_load
    fill_in "Sample", with: @scratch_indentation.sample
    fill_in "Stroke", with: @scratch_indentation.stroke
    fill_in "Temperature", with: @scratch_indentation.temperature
    fill_in "Type", with: @scratch_indentation.type
    click_on "Create Scratch indentation"

    assert_text "Scratch indentation was successfully created"
    click_on "Back"
  end

  test "should update Scratch indentation" do
    visit scratch_indentation_url(@scratch_indentation)
    click_on "Edit this scratch indentation", match: :first

    fill_in "Analysis", with: @scratch_indentation.analysis
    fill_in "Constant load", with: @scratch_indentation.constant_load
    fill_in "Increment load", with: @scratch_indentation.increment_load
    fill_in "Measurement", with: @scratch_indentation.measurement
    fill_in "More", with: @scratch_indentation.more
    fill_in "Number indentation", with: @scratch_indentation.number_indentation
    fill_in "Progressive load", with: @scratch_indentation.progressive_load
    fill_in "Sample", with: @scratch_indentation.sample
    fill_in "Stroke", with: @scratch_indentation.stroke
    fill_in "Temperature", with: @scratch_indentation.temperature
    fill_in "Type", with: @scratch_indentation.type
    click_on "Update Scratch indentation"

    assert_text "Scratch indentation was successfully updated"
    click_on "Back"
  end

  test "should destroy Scratch indentation" do
    visit scratch_indentation_url(@scratch_indentation)
    click_on "Destroy this scratch indentation", match: :first

    assert_text "Scratch indentation was successfully destroyed"
  end
end
