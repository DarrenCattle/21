class ChallengeMailer < ActionMailer::Base
  default from: "hola@juntostudio.com"

  def reminder(user)
    @user = user
    mail to: user.email, subject: "Reminder: 21 day Challenge!"
  end

  def auto_fail(user)
    @user = user
    mail to: user.email, subject: "21 Day Challenge: Back to Day 0."
  end

end
