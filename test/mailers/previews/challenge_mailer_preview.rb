# Preview all emails at http://localhost:3000/rails/mailers/challenge_mailer
class ChallengeMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/challenge_mailer/reminder
  def reminder
    ChallengeMailer.reminder
  end

end
