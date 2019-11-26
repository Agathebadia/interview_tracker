# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

JobApplication.destroy_all
puts "Destroyed job app"
User.destroy_all
puts "Destroyed users"

user = User.new(email: "anna@example.com", password: "123456")
user.save!
puts "User was created"

job_opening1 = JobApplication.new(job_title: "Developer", company_name: "Zalando", recruiter_email: "azerty@example.com", status: "Interviewing", recruiter_name: "Sarah")

job_opening2 = JobApplication.new(job_title: "Developer", company_name: "Zalando", recruiter_email: "azerty@example.com", status: "Interviewing", recruiter_name: "Sarah")

job_opening3 = JobApplication.new(job_title: "Developer", company_name: "Zalando", recruiter_email: "azerty@example.com", status: "Interviewing", recruiter_name: "Sarah")

job_opening1.user_id = user.id
puts "We are adding user to job_opening1"

job_opening2.user_id = user.id
puts "We are adding user to job_opening2"

job_opening3.user_id = user.id
puts "We are adding user to job_opening3"

job_opening1.save!
job_opening2.save!
job_opening3.save!

puts "Finished"


