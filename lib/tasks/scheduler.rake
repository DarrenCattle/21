desc "Heroku scheduler tasks"
task :set_entered_to_false => :environment do
  puts "Resetting entered? values"
  users = User.america_users
  users.each do |user|
    if user.current_challenge
      user.current_challenge.update_attribute(:entered, false)
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
      user.current_challenge.update_attribute(:entered, false)
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

