# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
PublicActivity::Activity.destroy_all

users = User.create!([{ name: "Test", email: "test@testing.com", password: "123123123", password_confirmation: "123123123" }, { name: "Test 2", email: "testing@testing.com", password: "123123123", password_confirmation: "123123123" }, { name: "Max", email: "max@juntostudio.com", password: "123123123", password_confirmation: "123123123" }])

users.each do |user|
	user.save
	puts user.inspect
	c = user.challenges.build({ day: 0, reason: "This is a test reason", name: "This is a test name" })
	c.save
	puts c.inspect
	c.update(day: 1)
	c.create_activity :reset_days, owner: user, challenge_day: 0, message: "Failed Sample message from #{user.name}"
	a = c.create_activity :update_days, owner: user, challenge_day: c.day, message: "Completed Sample message from #{user.name}"
	a.save
	puts a.inspect
end