require "test_helper"

class AtomicForceMicroscopesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @atomic_force_microscope = atomic_force_microscopes(:one)
  end

  test "should get index" do
    get atomic_force_microscopes_url
    assert_response :success
  end

  test "should get new" do
    get new_atomic_force_microscope_url
    assert_response :success
  end

  test "should create atomic_force_microscope" do
    assert_difference("AtomicForceMicroscope.count") do
      post atomic_force_microscopes_url, params: { atomic_force_microscope: { carcinogenic: @atomic_force_microscope.carcinogenic, compatability: @atomic_force_microscope.compatability, description: @atomic_force_microscope.description, more: @atomic_force_microscope.more, sample: @atomic_force_microscope.sample, scan_rate: @atomic_force_microscope.scan_rate, stype: @atomic_force_microscope.stype, technique: @atomic_force_microscope.technique, toxicity: @atomic_force_microscope.toxicity, x: @atomic_force_microscope.x, y: @atomic_force_microscope.y } }
    end

    assert_redirected_to atomic_force_microscope_url(AtomicForceMicroscope.last)
  end

  test "should show atomic_force_microscope" do
    get atomic_force_microscope_url(@atomic_force_microscope)
    assert_response :success
  end

  test "should get edit" do
    get edit_atomic_force_microscope_url(@atomic_force_microscope)
    assert_response :success
  end

  test "should update atomic_force_microscope" do
    patch atomic_force_microscope_url(@atomic_force_microscope), params: { atomic_force_microscope: { carcinogenic: @atomic_force_microscope.carcinogenic, compatability: @atomic_force_microscope.compatability, description: @atomic_force_microscope.description, more: @atomic_force_microscope.more, sample: @atomic_force_microscope.sample, scan_rate: @atomic_force_microscope.scan_rate, stype: @atomic_force_microscope.stype, technique: @atomic_force_microscope.technique, toxicity: @atomic_force_microscope.toxicity, x: @atomic_force_microscope.x, y: @atomic_force_microscope.y } }
    assert_redirected_to atomic_force_microscope_url(@atomic_force_microscope)
  end

  test "should destroy atomic_force_microscope" do
    assert_difference("AtomicForceMicroscope.count", -1) do
      delete atomic_force_microscope_url(@atomic_force_microscope)
    end

    assert_redirected_to atomic_force_microscopes_url
  end
end
