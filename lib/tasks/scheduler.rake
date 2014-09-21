desc "Heroku scheduler tasks"
task :set_entered_to_false => :environment do
  puts "Resetting entered? values"
  Challenge.reset_entered
  puts "Entered attributes reset!"
end