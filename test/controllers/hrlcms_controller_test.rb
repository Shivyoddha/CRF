require "test_helper"

class HrlcmsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hrlcm = hrlcms(:one)
  end

  test "should get index" do
    get hrlcms_url
    assert_response :success
  end

  test "should get new" do
    get new_hrlcm_url
    assert_response :success
  end

  test "should create hrlcm" do
    assert_difference("Hrlcm.count") do
      post hrlcms_url, params: { hrlcm: { analysis: @hrlcm.analysis, category: @hrlcm.category, disposal: @hrlcm.disposal, health: @hrlcm.health, incompatible: @hrlcm.incompatible, more: @hrlcm.more, nature_sample: @hrlcm.nature_sample, sample: @hrlcm.sample, sample_concentration: @hrlcm.sample_concentration, sample_contains: @hrlcm.sample_contains, sample_salts: @hrlcm.sample_salts, sample_type: @hrlcm.sample_type, sample_volume: @hrlcm.sample_volume, solvent: @hrlcm.solvent, storage: @hrlcm.storage, testing_required: @hrlcm.testing_required, toxicity: @hrlcm.toxicity } }
    end

    assert_redirected_to hrlcm_url(Hrlcm.last)
  end

  test "should show hrlcm" do
    get hrlcm_url(@hrlcm)
    assert_response :success
  end

  test "should get edit" do
    get edit_hrlcm_url(@hrlcm)
    assert_response :success
  end

  test "should update hrlcm" do
    patch hrlcm_url(@hrlcm), params: { hrlcm: { analysis: @hrlcm.analysis, category: @hrlcm.category, disposal: @hrlcm.disposal, health: @hrlcm.health, incompatible: @hrlcm.incompatible, more: @hrlcm.more, nature_sample: @hrlcm.nature_sample, sample: @hrlcm.sample, sample_concentration: @hrlcm.sample_concentration, sample_contains: @hrlcm.sample_contains, sample_salts: @hrlcm.sample_salts, sample_type: @hrlcm.sample_type, sample_volume: @hrlcm.sample_volume, solvent: @hrlcm.solvent, storage: @hrlcm.storage, testing_required: @hrlcm.testing_required, toxicity: @hrlcm.toxicity } }
    assert_redirected_to hrlcm_url(@hrlcm)
  end

  test "should destroy hrlcm" do
    assert_difference("Hrlcm.count", -1) do
      delete hrlcm_url(@hrlcm)
    end

    assert_redirected_to hrlcms_url
  end
end
