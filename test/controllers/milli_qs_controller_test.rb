require "test_helper"

class MilliQsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @milli_q = milli_qs(:one)
  end

  test "should get index" do
    get milli_qs_url
    assert_response :success
  end

  test "should get new" do
    get new_milli_q_url
    assert_response :success
  end

  test "should create milli_q" do
    assert_difference('MilliQ.count') do
      post milli_qs_url, params: { milli_q: { debit: @milli_q.debit, more: @milli_q.more, slotdate: @milli_q.slotdate, slottime: @milli_q.slottime, status: @milli_q.status, typewater: @milli_q.typewater, volumeone: @milli_q.volumeone, volumetwo: @milli_q.volumetwo } }
    end

    assert_redirected_to milli_q_url(MilliQ.last)
  end

  test "should show milli_q" do
    get milli_q_url(@milli_q)
    assert_response :success
  end

  test "should get edit" do
    get edit_milli_q_url(@milli_q)
    assert_response :success
  end

  test "should update milli_q" do
    patch milli_q_url(@milli_q), params: { milli_q: { debit: @milli_q.debit, more: @milli_q.more, slotdate: @milli_q.slotdate, slottime: @milli_q.slottime, status: @milli_q.status, typewater: @milli_q.typewater, volumeone: @milli_q.volumeone, volumetwo: @milli_q.volumetwo } }
    assert_redirected_to milli_q_url(@milli_q)
  end

  test "should destroy milli_q" do
    assert_difference('MilliQ.count', -1) do
      delete milli_q_url(@milli_q)
    end

    assert_redirected_to milli_qs_url
  end
end
