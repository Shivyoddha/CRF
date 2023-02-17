require "test_helper"

class HrFesemJsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hr_fesem_j = hr_fesem_js(:one)
  end

  test "should get index" do
    get hr_fesem_js_url
    assert_response :success
  end

  test "should get new" do
    get new_hr_fesem_j_url
    assert_response :success
  end

  test "should create hr_fesem_j" do
    assert_difference("HrFesemJ.count") do
      post hr_fesem_js_url, params: { hr_fesem_j: { composition: @hr_fesem_j.composition, conducting: @hr_fesem_j.conducting, eds_required: @hr_fesem_j.eds_required, measurement: @hr_fesem_j.measurement, more: @hr_fesem_j.more, sample: @hr_fesem_j.sample, sphase: @hr_fesem_j.sphase, stype: @hr_fesem_j.stype, toxic: @hr_fesem_j.toxic } }
    end

    assert_redirected_to hr_fesem_j_url(HrFesemJ.last)
  end

  test "should show hr_fesem_j" do
    get hr_fesem_j_url(@hr_fesem_j)
    assert_response :success
  end

  test "should get edit" do
    get edit_hr_fesem_j_url(@hr_fesem_j)
    assert_response :success
  end

  test "should update hr_fesem_j" do
    patch hr_fesem_j_url(@hr_fesem_j), params: { hr_fesem_j: { composition: @hr_fesem_j.composition, conducting: @hr_fesem_j.conducting, eds_required: @hr_fesem_j.eds_required, measurement: @hr_fesem_j.measurement, more: @hr_fesem_j.more, sample: @hr_fesem_j.sample, sphase: @hr_fesem_j.sphase, stype: @hr_fesem_j.stype, toxic: @hr_fesem_j.toxic } }
    assert_redirected_to hr_fesem_j_url(@hr_fesem_j)
  end

  test "should destroy hr_fesem_j" do
    assert_difference("HrFesemJ.count", -1) do
      delete hr_fesem_j_url(@hr_fesem_j)
    end

    assert_redirected_to hr_fesem_js_url
  end
end
