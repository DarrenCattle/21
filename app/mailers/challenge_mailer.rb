class ChallengeMailer < ActionMailer::Base
  default from: "hola@juntostudio.com"

  def reminder(user)
    @user = user
    mail to: user.email, subject: "Reminder: 21 day Challenge!"
  end
end
