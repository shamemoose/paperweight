# Users
User.create!(name:     "admin",
             email:    "admin@paperweight.biz",
             password: "foobar")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@paperweight.biz"
  password = "password"
  User.create!(name:     name,
               email:    email,
               password: password)
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }