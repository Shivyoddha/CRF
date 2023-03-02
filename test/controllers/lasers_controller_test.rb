require "test_helper"

class LasersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @laser = lasers(:one)
  end

  test "should get index" do
    get lasers_url
    assert_response :success
  end

  test "should get new" do
    get new_laser_url
    assert_response :success
  end

  test "should create laser" do
    assert_difference('Laser.count') do
      post lasers_url, params: { laser: { compatibility: @laser.compatibility, composition: @laser.composition, debit: @laser.debit, more: @laser.more, sample: @laser.sample, slotdate: @laser.slotdate, slottime: @laser.slottime, status: @laser.status, stype: @laser.stype, temp_points: @laser.temp_points, toxicity: @laser.toxicity } }
    end

    assert_redirected_to laser_url(Laser.last)
  end

  test "should show laser" do
    get laser_url(@laser)
    assert_response :success
  end

  test "should get edit" do
    get edit_laser_url(@laser)
    assert_response :success
  end

  test "should update laser" do
    patch laser_url(@laser), params: { laser: { compatibility: @laser.compatibility, composition: @laser.composition, debit: @laser.debit, more: @laser.more, sample: @laser.sample, slotdate: @laser.slotdate, slottime: @laser.slottime, status: @laser.status, stype: @laser.stype, temp_points: @laser.temp_points, toxicity: @laser.toxicity } }
    assert_redirected_to laser_url(@laser)
  end

  test "should destroy laser" do
    assert_difference('Laser.count', -1) do
      delete laser_url(@laser)
    end

    assert_redirected_to lasers_url
  end
end
