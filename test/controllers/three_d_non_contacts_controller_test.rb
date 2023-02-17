require "test_helper"

class ThreeDNonContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @three_d_non_contact = three_d_non_contacts(:one)
  end

  test "should get index" do
    get three_d_non_contacts_url
    assert_response :success
  end

  test "should get new" do
    get new_three_d_non_contact_url
    assert_response :success
  end

  test "should create three_d_non_contact" do
    assert_difference("ThreeDNonContact.count") do
      post three_d_non_contacts_url, params: { three_d_non_contact: { incompatible: @three_d_non_contact.incompatible, more: @three_d_non_contact.more, range: @three_d_non_contact.range, sample: @three_d_non_contact.sample, scant: @three_d_non_contact.scant, stepinterval: @three_d_non_contact.stepinterval, toxicity: @three_d_non_contact.toxicity } }
    end

    assert_redirected_to three_d_non_contact_url(ThreeDNonContact.last)
  end

  test "should show three_d_non_contact" do
    get three_d_non_contact_url(@three_d_non_contact)
    assert_response :success
  end

  test "should get edit" do
    get edit_three_d_non_contact_url(@three_d_non_contact)
    assert_response :success
  end

  test "should update three_d_non_contact" do
    patch three_d_non_contact_url(@three_d_non_contact), params: { three_d_non_contact: { incompatible: @three_d_non_contact.incompatible, more: @three_d_non_contact.more, range: @three_d_non_contact.range, sample: @three_d_non_contact.sample, scant: @three_d_non_contact.scant, stepinterval: @three_d_non_contact.stepinterval, toxicity: @three_d_non_contact.toxicity } }
    assert_redirected_to three_d_non_contact_url(@three_d_non_contact)
  end

  test "should destroy three_d_non_contact" do
    assert_difference("ThreeDNonContact.count", -1) do
      delete three_d_non_contact_url(@three_d_non_contact)
    end

    assert_redirected_to three_d_non_contacts_url
  end
end
