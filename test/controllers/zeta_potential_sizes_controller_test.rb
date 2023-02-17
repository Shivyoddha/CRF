require "test_helper"

class ZetaPotentialSizesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @zeta_potential_size = zeta_potential_sizes(:one)
  end

  test "should get index" do
    get zeta_potential_sizes_url
    assert_response :success
  end

  test "should get new" do
    get new_zeta_potential_size_url
    assert_response :success
  end

  test "should create zeta_potential_size" do
    assert_difference("ZetaPotentialSize.count") do
      post zeta_potential_sizes_url, params: { zeta_potential_size: { analysis_temperature: @zeta_potential_size.analysis_temperature, analysis_type: @zeta_potential_size.analysis_type, angle: @zeta_potential_size.angle, element: @zeta_potential_size.element, more: @zeta_potential_size.more, refractive_index: @zeta_potential_size.refractive_index, sample: @zeta_potential_size.sample, solute: @zeta_potential_size.solute, solvent: @zeta_potential_size.solvent, toxicity: @zeta_potential_size.toxicity, type: @zeta_potential_size.type, viscosity: @zeta_potential_size.viscosity } }
    end

    assert_redirected_to zeta_potential_size_url(ZetaPotentialSize.last)
  end

  test "should show zeta_potential_size" do
    get zeta_potential_size_url(@zeta_potential_size)
    assert_response :success
  end

  test "should get edit" do
    get edit_zeta_potential_size_url(@zeta_potential_size)
    assert_response :success
  end

  test "should update zeta_potential_size" do
    patch zeta_potential_size_url(@zeta_potential_size), params: { zeta_potential_size: { analysis_temperature: @zeta_potential_size.analysis_temperature, analysis_type: @zeta_potential_size.analysis_type, angle: @zeta_potential_size.angle, element: @zeta_potential_size.element, more: @zeta_potential_size.more, refractive_index: @zeta_potential_size.refractive_index, sample: @zeta_potential_size.sample, solute: @zeta_potential_size.solute, solvent: @zeta_potential_size.solvent, toxicity: @zeta_potential_size.toxicity, type: @zeta_potential_size.type, viscosity: @zeta_potential_size.viscosity } }
    assert_redirected_to zeta_potential_size_url(@zeta_potential_size)
  end

  test "should destroy zeta_potential_size" do
    assert_difference("ZetaPotentialSize.count", -1) do
      delete zeta_potential_size_url(@zeta_potential_size)
    end

    assert_redirected_to zeta_potential_sizes_url
  end
end
