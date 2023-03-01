require "application_system_test_case"

class SparkOsTest < ApplicationSystemTestCase
  setup do
    @spark_o = spark_os(:one)
  end

  test "visiting the index" do
    visit spark_os_url
    assert_selector "h1", text: "Spark Os"
  end

  test "creating a Spark o" do
    visit spark_os_url
    click_on "New Spark O"

    fill_in "Composition", with: @spark_o.composition
    fill_in "Debit", with: @spark_o.debit
    fill_in "More", with: @spark_o.more
    fill_in "Sample", with: @spark_o.sample
    fill_in "Sampleal", with: @spark_o.sampleal
    fill_in "Samplecu", with: @spark_o.samplecu
    fill_in "Samplefe", with: @spark_o.samplefe
    fill_in "Samplemg", with: @spark_o.samplemg
    fill_in "Sampleni", with: @spark_o.sampleni
    fill_in "Samplepb", with: @spark_o.samplepb
    fill_in "Samplesn", with: @spark_o.samplesn
    fill_in "Sampleti", with: @spark_o.sampleti
    fill_in "Samplezn", with: @spark_o.samplezn
    fill_in "Slotdate", with: @spark_o.slotdate
    fill_in "Slottime", with: @spark_o.slottime
    fill_in "Status", with: @spark_o.status
    click_on "Create Spark o"

    assert_text "Spark o was successfully created"
    click_on "Back"
  end

  test "updating a Spark o" do
    visit spark_os_url
    click_on "Edit", match: :first

    fill_in "Composition", with: @spark_o.composition
    fill_in "Debit", with: @spark_o.debit
    fill_in "More", with: @spark_o.more
    fill_in "Sample", with: @spark_o.sample
    fill_in "Sampleal", with: @spark_o.sampleal
    fill_in "Samplecu", with: @spark_o.samplecu
    fill_in "Samplefe", with: @spark_o.samplefe
    fill_in "Samplemg", with: @spark_o.samplemg
    fill_in "Sampleni", with: @spark_o.sampleni
    fill_in "Samplepb", with: @spark_o.samplepb
    fill_in "Samplesn", with: @spark_o.samplesn
    fill_in "Sampleti", with: @spark_o.sampleti
    fill_in "Samplezn", with: @spark_o.samplezn
    fill_in "Slotdate", with: @spark_o.slotdate
    fill_in "Slottime", with: @spark_o.slottime
    fill_in "Status", with: @spark_o.status
    click_on "Update Spark o"

    assert_text "Spark o was successfully updated"
    click_on "Back"
  end

  test "destroying a Spark o" do
    visit spark_os_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Spark o was successfully destroyed"
  end
end
