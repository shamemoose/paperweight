# Users
User.create!(name:     "admin",
             email:    "admin@paperweight.biz",
             password: "foobar",
             password_confirmation: "foobar",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@paperweight.biz"
  password = "password"
  User.create!(name:     name,
               email:    email,
               password: password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
  title = Faker::Lorem.sentence(4)
  description = Faker::Lorem.sentence(20)
  users.each { |user| user.publications.create!(title: title, description: description) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }