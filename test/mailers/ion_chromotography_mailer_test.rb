require "test_helper"

class IonChromotographyMailerTest < ActionMailer::TestCase
  test "Mail" do
    mail = IonChromotographyMailer.Mail
    assert_equal "Mail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
