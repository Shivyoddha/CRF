require "test_helper"

class FtNmsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ft_nm = ft_nms(:one)
  end

  test "should get index" do
    get ft_nms_url
    assert_response :success
  end

  test "should get new" do
    get new_ft_nm_url
    assert_response :success
  end

  test "should create ft_nm" do
    assert_difference('FtNm.count') do
      post ft_nms_url, params: { ft_nm: { debit: @ft_nm.debit, health: @ft_nm.health, measurement1: @ft_nm.measurement1, measurement2: @ft_nm.measurement2, measurement3: @ft_nm.measurement3, measurement4: @ft_nm.measurement4, measurement5: @ft_nm.measurement5, more: @ft_nm.more, nature: @ft_nm.nature, phase: @ft_nm.phase, sample: @ft_nm.sample, slotdate: @ft_nm.slotdate, slottime: @ft_nm.slottime, solvent1: @ft_nm.solvent1, solvent2: @ft_nm.solvent2, solvent3: @ft_nm.solvent3, solvent4: @ft_nm.solvent4, solvent5: @ft_nm.solvent5, status: @ft_nm.status, toxicity: @ft_nm.toxicity } }
    end

    assert_redirected_to ft_nm_url(FtNm.last)
  end

  test "should show ft_nm" do
    get ft_nm_url(@ft_nm)
    assert_response :success
  end

  test "should get edit" do
    get edit_ft_nm_url(@ft_nm)
    assert_response :success
  end

  test "should update ft_nm" do
    patch ft_nm_url(@ft_nm), params: { ft_nm: { debit: @ft_nm.debit, health: @ft_nm.health, measurement1: @ft_nm.measurement1, measurement2: @ft_nm.measurement2, measurement3: @ft_nm.measurement3, measurement4: @ft_nm.measurement4, measurement5: @ft_nm.measurement5, more: @ft_nm.more, nature: @ft_nm.nature, phase: @ft_nm.phase, sample: @ft_nm.sample, slotdate: @ft_nm.slotdate, slottime: @ft_nm.slottime, solvent1: @ft_nm.solvent1, solvent2: @ft_nm.solvent2, solvent3: @ft_nm.solvent3, solvent4: @ft_nm.solvent4, solvent5: @ft_nm.solvent5, status: @ft_nm.status, toxicity: @ft_nm.toxicity } }
    assert_redirected_to ft_nm_url(@ft_nm)
  end

  test "should destroy ft_nm" do
    assert_difference('FtNm.count', -1) do
      delete ft_nm_url(@ft_nm)
    end

    assert_redirected_to ft_nms_url
  end
end
