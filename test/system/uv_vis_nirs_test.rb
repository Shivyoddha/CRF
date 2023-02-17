require "application_system_test_case"

class UvVisNirsTest < ApplicationSystemTestCase
  setup do
    @uv_vis_nir = uv_vis_nirs(:one)
  end

  test "visiting the index" do
    visit uv_vis_nirs_url
    assert_selector "h1", text: "Uv vis nirs"
  end

  test "should create uv vis nir" do
    visit uv_vis_nirs_url
    click_on "New uv vis nir"

    fill_in "Composition", with: @uv_vis_nir.composition
    fill_in "Erange", with: @uv_vis_nir.erange
    fill_in "Measurement", with: @uv_vis_nir.measurement
    fill_in "More", with: @uv_vis_nir.more
    fill_in "Sample", with: @uv_vis_nir.sample
    fill_in "Sampletype", with: @uv_vis_nir.sampletype
    fill_in "Srange", with: @uv_vis_nir.srange
    fill_in "Toxicity", with: @uv_vis_nir.toxicity
    click_on "Create Uv vis nir"

    assert_text "Uv vis nir was successfully created"
    click_on "Back"
  end

  test "should update Uv vis nir" do
    visit uv_vis_nir_url(@uv_vis_nir)
    click_on "Edit this uv vis nir", match: :first

    fill_in "Composition", with: @uv_vis_nir.composition
    fill_in "Erange", with: @uv_vis_nir.erange
    fill_in "Measurement", with: @uv_vis_nir.measurement
    fill_in "More", with: @uv_vis_nir.more
    fill_in "Sample", with: @uv_vis_nir.sample
    fill_in "Sampletype", with: @uv_vis_nir.sampletype
    fill_in "Srange", with: @uv_vis_nir.srange
    fill_in "Toxicity", with: @uv_vis_nir.toxicity
    click_on "Update Uv vis nir"

    assert_text "Uv vis nir was successfully updated"
    click_on "Back"
  end

  test "should destroy Uv vis nir" do
    visit uv_vis_nir_url(@uv_vis_nir)
    click_on "Destroy this uv vis nir", match: :first

    assert_text "Uv vis nir was successfully destroyed"
  end
end
