sentences = ['"I failed my way to success." - Thomas Edison. #youcandothis',
             '"I can accept failure, but I can\'t accept not trying" - Michael Jordan #practicemakesperfect',
             '"It\'s fine to celebrate success but it is more important to heed the lessons of failure." - Bill Gates #0101101',
             '"Do not be embarrassed by your failures, learn from them and start again." - Richard Branson #tryandtryagain',
             '"Do not fear mistakes. You will know failure. Continue to reach out." - Benjamin Franklin #lightning'
           ]

desc "Heroku scheduler tasks"
task :set_entered_to_false => :environment do
  puts "Resetting entered? values"
  users = User.america_users
  users.each do |user|
    if user.current_challenge
      if user.current_challenge.entered == false && user.current_challenge.day > 0
        ChallengeMailer.auto_fail(user).deliver
        user.current_challenge.update_attribute(:day, 0)
        user.current_challenge.create_activity :reset_days, owner: user, challenge_day: 0, message: sentences.sample
      end
      user.current_challenge.update_attribute(:entered, false)
    end
  end
  puts "Entered attributes reset!"
end

desc "Heroku scheduler tasks"
task :reminder => :environment do
  puts "Sending reminder emails"
  users = User.reminder_email_ready_america
  count = 0
  users.each do |user|
	  if user.current_challenge && user.current_challenge.entered == false
      ChallengeMailer.reminder(user).deliver
      count = count + 1
    end
  end
  puts "Reminder Emails (#{count}) sent successfully!"
end

desc "Heroku scheduler tasks"
task :set_entered_to_false_europe => :environment do
  puts "Resetting entered? values"
  users = User.europe_users
  users.each do |user|
    if user.current_challenge
      if user.current_challenge.entered == false && user.current_challenge.day > 0
        ChallengeMailer.auto_fail(user).deliver
        user.current_challenge.update_attribute(:day, 0)
        user.current_challenge.create_activity :reset_days, owner: user, challenge_day: 0, message: sentences.sample
      end
      user.current_challenge.update_attribute(:entered, false)
    end
  end
  puts "Entered attributes reset!"
end

desc "Heroku scheduler tasks"
task :reminder_europe => :environment do
  puts "Sending reminder emails"
  users = User.reminder_email_ready_europe
  count = 0
  users.each do |user|
    if user.current_challenge && user.current_challenge.entered == false
      ChallengeMailer.reminder(user).deliver
      count = count + 1
    end
  end
  puts "Reminder Emails (#{count}) sent successfully!"
end

