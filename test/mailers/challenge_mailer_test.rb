require 'test_helper'

class ChallengeMailerTest < ActionMailer::TestCase
  test "reminder" do
    mail = ChallengeMailer.reminder
    assert_equal "Reminder", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
