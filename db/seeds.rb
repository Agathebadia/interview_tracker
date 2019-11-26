# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
JobApplication.destroy_all


user = User.new(email: "anna@example.com", password: "123456")
user.save!
puts "User was created"

job_opening = JobApplication.new(job_title: "Developer", company_name: "Zalando", recruiter_email: "azerty@example.com", status: "Interviewing", recruiter_name: "Sarah")

job_opening.user_id = user.id
puts "We are adding user to job_opening"

job_opening.save!
job.opening
puts "Job opening was created"


