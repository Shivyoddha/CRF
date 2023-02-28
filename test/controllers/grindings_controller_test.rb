require "test_helper"

class GrindingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grinding = grindings(:one)
  end

  test "should get index" do
    get grindings_url
    assert_response :success
  end

  test "should get new" do
    get new_grinding_url
    assert_response :success
  end

  test "should create grinding" do
    assert_difference('Grinding.count') do
      post grindings_url, params: { grinding: { debit: @grinding.debit, diameter: @grinding.diameter, diamond: @grinding.diamond, grit: @grinding.grit, lapping: @grinding.lapping, more: @grinding.more, mould: @grinding.mould, sample: @grinding.sample, slotdate: @grinding.slotdate, slottime: @grinding.slottime, status: @grinding.status, suspension: @grinding.suspension } }
    end

    assert_redirected_to grinding_url(Grinding.last)
  end

  test "should show grinding" do
    get grinding_url(@grinding)
    assert_response :success
  end

  test "should get edit" do
    get edit_grinding_url(@grinding)
    assert_response :success
  end

  test "should update grinding" do
    patch grinding_url(@grinding), params: { grinding: { debit: @grinding.debit, diameter: @grinding.diameter, diamond: @grinding.diamond, grit: @grinding.grit, lapping: @grinding.lapping, more: @grinding.more, mould: @grinding.mould, sample: @grinding.sample, slotdate: @grinding.slotdate, slottime: @grinding.slottime, status: @grinding.status, suspension: @grinding.suspension } }
    assert_redirected_to grinding_url(@grinding)
  end

  test "should destroy grinding" do
    assert_difference('Grinding.count', -1) do
      delete grinding_url(@grinding)
    end

    assert_redirected_to grindings_url
  end
end
