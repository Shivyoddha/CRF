require "test_helper"

class FtNmrsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ft_nmr = ft_nmrs(:one)
  end

  test "should get index" do
    get ft_nmrs_url
    assert_response :success
  end

  test "should get new" do
    get new_ft_nmr_url
    assert_response :success
  end

  test "should create ft_nmr" do
    assert_difference("FtNmr.count") do
      post ft_nmrs_url, params: { ft_nmr: { health: @ft_nmr.health, more: @ft_nmr.more, sample: @ft_nmr.sample, sample_nature: @ft_nmr.sample_nature, sample_phase: @ft_nmr.sample_phase, storage: @ft_nmr.storage, toxicity: @ft_nmr.toxicity } }
    end

    assert_redirected_to ft_nmr_url(FtNmr.last)
  end

  test "should show ft_nmr" do
    get ft_nmr_url(@ft_nmr)
    assert_response :success
  end

  test "should get edit" do
    get edit_ft_nmr_url(@ft_nmr)
    assert_response :success
  end

  test "should update ft_nmr" do
    patch ft_nmr_url(@ft_nmr), params: { ft_nmr: { health: @ft_nmr.health, more: @ft_nmr.more, sample: @ft_nmr.sample, sample_nature: @ft_nmr.sample_nature, sample_phase: @ft_nmr.sample_phase, storage: @ft_nmr.storage, toxicity: @ft_nmr.toxicity } }
    assert_redirected_to ft_nmr_url(@ft_nmr)
  end

  test "should destroy ft_nmr" do
    assert_difference("FtNmr.count", -1) do
      delete ft_nmr_url(@ft_nmr)
    end

    assert_redirected_to ft_nmrs_url
  end
end
