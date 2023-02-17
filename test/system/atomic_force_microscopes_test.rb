require "application_system_test_case"

class AtomicForceMicroscopesTest < ApplicationSystemTestCase
  setup do
    @atomic_force_microscope = atomic_force_microscopes(:one)
  end

  test "visiting the index" do
    visit atomic_force_microscopes_url
    assert_selector "h1", text: "Atomic force microscopes"
  end

  test "should create atomic force microscope" do
    visit atomic_force_microscopes_url
    click_on "New atomic force microscope"

    fill_in "Carcinogenic", with: @atomic_force_microscope.carcinogenic
    fill_in "Compatability", with: @atomic_force_microscope.compatability
    fill_in "Description", with: @atomic_force_microscope.description
    fill_in "More", with: @atomic_force_microscope.more
    fill_in "Sample", with: @atomic_force_microscope.sample
    fill_in "Scan rate", with: @atomic_force_microscope.scan_rate
    fill_in "Stype", with: @atomic_force_microscope.stype
    fill_in "Technique", with: @atomic_force_microscope.technique
    fill_in "Toxicity", with: @atomic_force_microscope.toxicity
    fill_in "X", with: @atomic_force_microscope.x
    fill_in "Y", with: @atomic_force_microscope.y
    click_on "Create Atomic force microscope"

    assert_text "Atomic force microscope was successfully created"
    click_on "Back"
  end

  test "should update Atomic force microscope" do
    visit atomic_force_microscope_url(@atomic_force_microscope)
    click_on "Edit this atomic force microscope", match: :first

    fill_in "Carcinogenic", with: @atomic_force_microscope.carcinogenic
    fill_in "Compatability", with: @atomic_force_microscope.compatability
    fill_in "Description", with: @atomic_force_microscope.description
    fill_in "More", with: @atomic_force_microscope.more
    fill_in "Sample", with: @atomic_force_microscope.sample
    fill_in "Scan rate", with: @atomic_force_microscope.scan_rate
    fill_in "Stype", with: @atomic_force_microscope.stype
    fill_in "Technique", with: @atomic_force_microscope.technique
    fill_in "Toxicity", with: @atomic_force_microscope.toxicity
    fill_in "X", with: @atomic_force_microscope.x
    fill_in "Y", with: @atomic_force_microscope.y
    click_on "Update Atomic force microscope"

    assert_text "Atomic force microscope was successfully updated"
    click_on "Back"
  end

  test "should destroy Atomic force microscope" do
    visit atomic_force_microscope_url(@atomic_force_microscope)
    click_on "Destroy this atomic force microscope", match: :first

    assert_text "Atomic force microscope was successfully destroyed"
  end
end
