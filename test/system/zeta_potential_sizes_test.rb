require "application_system_test_case"

class ZetaPotentialSizesTest < ApplicationSystemTestCase
  setup do
    @zeta_potential_size = zeta_potential_sizes(:one)
  end

  test "visiting the index" do
    visit zeta_potential_sizes_url
    assert_selector "h1", text: "Zeta potential sizes"
  end

  test "should create zeta potential size" do
    visit zeta_potential_sizes_url
    click_on "New zeta potential size"

    fill_in "Analysis temperature", with: @zeta_potential_size.analysis_temperature
    fill_in "Analysis type", with: @zeta_potential_size.analysis_type
    fill_in "Angle", with: @zeta_potential_size.angle
    fill_in "Element", with: @zeta_potential_size.element
    fill_in "More", with: @zeta_potential_size.more
    fill_in "Refractive index", with: @zeta_potential_size.refractive_index
    fill_in "Sample", with: @zeta_potential_size.sample
    fill_in "Solute", with: @zeta_potential_size.solute
    fill_in "Solvent", with: @zeta_potential_size.solvent
    fill_in "Toxicity", with: @zeta_potential_size.toxicity
    fill_in "Type", with: @zeta_potential_size.type
    fill_in "Viscosity", with: @zeta_potential_size.viscosity
    click_on "Create Zeta potential size"

    assert_text "Zeta potential size was successfully created"
    click_on "Back"
  end

  test "should update Zeta potential size" do
    visit zeta_potential_size_url(@zeta_potential_size)
    click_on "Edit this zeta potential size", match: :first

    fill_in "Analysis temperature", with: @zeta_potential_size.analysis_temperature
    fill_in "Analysis type", with: @zeta_potential_size.analysis_type
    fill_in "Angle", with: @zeta_potential_size.angle
    fill_in "Element", with: @zeta_potential_size.element
    fill_in "More", with: @zeta_potential_size.more
    fill_in "Refractive index", with: @zeta_potential_size.refractive_index
    fill_in "Sample", with: @zeta_potential_size.sample
    fill_in "Solute", with: @zeta_potential_size.solute
    fill_in "Solvent", with: @zeta_potential_size.solvent
    fill_in "Toxicity", with: @zeta_potential_size.toxicity
    fill_in "Type", with: @zeta_potential_size.type
    fill_in "Viscosity", with: @zeta_potential_size.viscosity
    click_on "Update Zeta potential size"

    assert_text "Zeta potential size was successfully updated"
    click_on "Back"
  end

  test "should destroy Zeta potential size" do
    visit zeta_potential_size_url(@zeta_potential_size)
    click_on "Destroy this zeta potential size", match: :first

    assert_text "Zeta potential size was successfully destroyed"
  end
end
