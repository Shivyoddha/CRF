require "test_helper"

class AnsiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ansy = ansies(:one)
  end

  test "should get index" do
    get ansies_url
    assert_response :success
  end

  test "should get new" do
    get new_ansy_url
    assert_response :success
  end

  test "should create ansy" do
    assert_difference('Ansy.count') do
      post ansies_url, params: { ansy: { amount: @ansy.amount, debit: @ansy.debit, purpose: @ansy.purpose, slotdate: @ansy.slotdate, sysno: @ansy.sysno } }
    end

    assert_redirected_to ansy_url(Ansy.last)
  end

  test "should show ansy" do
    get ansy_url(@ansy)
    assert_response :success
  end

  test "should get edit" do
    get edit_ansy_url(@ansy)
    assert_response :success
  end

  test "should update ansy" do
    patch ansy_url(@ansy), params: { ansy: { amount: @ansy.amount, debit: @ansy.debit, purpose: @ansy.purpose, slotdate: @ansy.slotdate, sysno: @ansy.sysno } }
    assert_redirected_to ansy_url(@ansy)
  end

  test "should destroy ansy" do
    assert_difference('Ansy.count', -1) do
      delete ansy_url(@ansy)
    end

    assert_redirected_to ansies_url
  end
end
