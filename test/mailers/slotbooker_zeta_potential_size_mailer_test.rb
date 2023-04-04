require "test_helper"

class SlotbookerZetaPotentialSizeMailerTest < ActionMailer::TestCase
  test "Mail" do
    mail = SlotbookerZetaPotentialSizeMailer.Mail
    assert_equal "Mail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
