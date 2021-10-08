User.create!(name:  "Administrator 00",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true, activated: true, activated_at: Time.zone.now)

User.create!(name: "Administrator 01",
             email:"mailtommrr@gmail.com",
             password:              "123456",
             password_confirmation: "123456",
             admin: true, activated: true, activated_at: Time.zone.now)

15.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
