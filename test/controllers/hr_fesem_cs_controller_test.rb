require "test_helper"

class HrFesemCsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hr_fesem_c = hr_fesem_cs(:one)
  end

  test "should get index" do
    get hr_fesem_cs_url
    assert_response :success
  end

  test "should get new" do
    get new_hr_fesem_c_url
    assert_response :success
  end

  test "should create hr_fesem_c" do
    assert_difference("HrFesemC.count") do
      post hr_fesem_cs_url, params: { hr_fesem_c: { composition: @hr_fesem_c.composition, conducting: @hr_fesem_c.conducting, eds_required: @hr_fesem_c.eds_required, measurement: @hr_fesem_c.measurement, more: @hr_fesem_c.more, sample: @hr_fesem_c.sample, sphase: @hr_fesem_c.sphase, stype: @hr_fesem_c.stype, toxic: @hr_fesem_c.toxic } }
    end

    assert_redirected_to hr_fesem_c_url(HrFesemC.last)
  end

  test "should show hr_fesem_c" do
    get hr_fesem_c_url(@hr_fesem_c)
    assert_response :success
  end

  test "should get edit" do
    get edit_hr_fesem_c_url(@hr_fesem_c)
    assert_response :success
  end

  test "should update hr_fesem_c" do
    patch hr_fesem_c_url(@hr_fesem_c), params: { hr_fesem_c: { composition: @hr_fesem_c.composition, conducting: @hr_fesem_c.conducting, eds_required: @hr_fesem_c.eds_required, measurement: @hr_fesem_c.measurement, more: @hr_fesem_c.more, sample: @hr_fesem_c.sample, sphase: @hr_fesem_c.sphase, stype: @hr_fesem_c.stype, toxic: @hr_fesem_c.toxic } }
    assert_redirected_to hr_fesem_c_url(@hr_fesem_c)
  end

  test "should destroy hr_fesem_c" do
    assert_difference("HrFesemC.count", -1) do
      delete hr_fesem_c_url(@hr_fesem_c)
    end

    assert_redirected_to hr_fesem_cs_url
  end
end
