desc "Heroku scheduler tasks"
task :set_entered_to_false => :environment do
  puts "Resetting entered? values"
  Challenge.reset_entered
  puts "Entered attributes reset!"
end

desc "Heroku scheduler tasks"
task :reminder => :environment do
  puts "Sending reminder emails"
  users = User.where(:entered? => false)
  users.each do |user|
      ChallengeMailer.reminder(user).deliver
  end
  puts "Reminder Emails (#{auditions.length}) sent successfully!"
end
