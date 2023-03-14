require "application_system_test_case"

class FtNmsTest < ApplicationSystemTestCase
  setup do
    @ft_nm = ft_nms(:one)
  end

  test "visiting the index" do
    visit ft_nms_url
    assert_selector "h1", text: "Ft Nms"
  end

  test "creating a Ft nm" do
    visit ft_nms_url
    click_on "New Ft Nm"

    fill_in "Debit", with: @ft_nm.debit
    fill_in "Health", with: @ft_nm.health
    fill_in "Measurement1", with: @ft_nm.measurement1
    fill_in "Measurement2", with: @ft_nm.measurement2
    fill_in "Measurement3", with: @ft_nm.measurement3
    fill_in "Measurement4", with: @ft_nm.measurement4
    fill_in "Measurement5", with: @ft_nm.measurement5
    fill_in "More", with: @ft_nm.more
    fill_in "Nature", with: @ft_nm.nature
    fill_in "Phase", with: @ft_nm.phase
    fill_in "Sample", with: @ft_nm.sample
    fill_in "Slotdate", with: @ft_nm.slotdate
    fill_in "Slottime", with: @ft_nm.slottime
    fill_in "Solvent1", with: @ft_nm.solvent1
    fill_in "Solvent2", with: @ft_nm.solvent2
    fill_in "Solvent3", with: @ft_nm.solvent3
    fill_in "Solvent4", with: @ft_nm.solvent4
    fill_in "Solvent5", with: @ft_nm.solvent5
    fill_in "Status", with: @ft_nm.status
    fill_in "Toxicity", with: @ft_nm.toxicity
    click_on "Create Ft nm"

    assert_text "Ft nm was successfully created"
    click_on "Back"
  end

  test "updating a Ft nm" do
    visit ft_nms_url
    click_on "Edit", match: :first

    fill_in "Debit", with: @ft_nm.debit
    fill_in "Health", with: @ft_nm.health
    fill_in "Measurement1", with: @ft_nm.measurement1
    fill_in "Measurement2", with: @ft_nm.measurement2
    fill_in "Measurement3", with: @ft_nm.measurement3
    fill_in "Measurement4", with: @ft_nm.measurement4
    fill_in "Measurement5", with: @ft_nm.measurement5
    fill_in "More", with: @ft_nm.more
    fill_in "Nature", with: @ft_nm.nature
    fill_in "Phase", with: @ft_nm.phase
    fill_in "Sample", with: @ft_nm.sample
    fill_in "Slotdate", with: @ft_nm.slotdate
    fill_in "Slottime", with: @ft_nm.slottime
    fill_in "Solvent1", with: @ft_nm.solvent1
    fill_in "Solvent2", with: @ft_nm.solvent2
    fill_in "Solvent3", with: @ft_nm.solvent3
    fill_in "Solvent4", with: @ft_nm.solvent4
    fill_in "Solvent5", with: @ft_nm.solvent5
    fill_in "Status", with: @ft_nm.status
    fill_in "Toxicity", with: @ft_nm.toxicity
    click_on "Update Ft nm"

    assert_text "Ft nm was successfully updated"
    click_on "Back"
  end

  test "destroying a Ft nm" do
    visit ft_nms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ft nm was successfully destroyed"
  end
end
