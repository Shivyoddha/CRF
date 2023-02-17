require "test_helper"

class UvVisNirsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @uv_vis_nir = uv_vis_nirs(:one)
  end

  test "should get index" do
    get uv_vis_nirs_url
    assert_response :success
  end

  test "should get new" do
    get new_uv_vis_nir_url
    assert_response :success
  end

  test "should create uv_vis_nir" do
    assert_difference("UvVisNir.count") do
      post uv_vis_nirs_url, params: { uv_vis_nir: { composition: @uv_vis_nir.composition, erange: @uv_vis_nir.erange, measurement: @uv_vis_nir.measurement, more: @uv_vis_nir.more, sample: @uv_vis_nir.sample, sampletype: @uv_vis_nir.sampletype, srange: @uv_vis_nir.srange, toxicity: @uv_vis_nir.toxicity } }
    end

    assert_redirected_to uv_vis_nir_url(UvVisNir.last)
  end

  test "should show uv_vis_nir" do
    get uv_vis_nir_url(@uv_vis_nir)
    assert_response :success
  end

  test "should get edit" do
    get edit_uv_vis_nir_url(@uv_vis_nir)
    assert_response :success
  end

  test "should update uv_vis_nir" do
    patch uv_vis_nir_url(@uv_vis_nir), params: { uv_vis_nir: { composition: @uv_vis_nir.composition, erange: @uv_vis_nir.erange, measurement: @uv_vis_nir.measurement, more: @uv_vis_nir.more, sample: @uv_vis_nir.sample, sampletype: @uv_vis_nir.sampletype, srange: @uv_vis_nir.srange, toxicity: @uv_vis_nir.toxicity } }
    assert_redirected_to uv_vis_nir_url(@uv_vis_nir)
  end

  test "should destroy uv_vis_nir" do
    assert_difference("UvVisNir.count", -1) do
      delete uv_vis_nir_url(@uv_vis_nir)
    end

    assert_redirected_to uv_vis_nirs_url
  end
end
