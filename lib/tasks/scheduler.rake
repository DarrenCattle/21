desc "Heroku scheduler tasks"
task :set_entered_to_false => :environment do
  puts "Resetting entered? values"
  Challenge.reset_entered
  puts "Entered attributes reset!"
end

desc "Heroku scheduler tasks"
task :reminder => :environment do
  puts "Sending reminder emails"
  users = User.all
  count = 0
  users.each do |user|
  	if user.current_challenge && user.current_challenge.entered
      ChallengeMailer.reminder(user).deliver
      count ++
    end
  end
  puts "Reminder Emails (#{count}) sent successfully!"
end
