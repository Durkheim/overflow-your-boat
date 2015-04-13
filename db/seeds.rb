# User.all.destroy # needed for Heroku

user = User.create(username: "morgsypie", email: "morgan@morgan.com", password: "password", location: "Chicago")

10.times do
  user.questions.create(title: Faker::Lorem.word, description: Faker::Lorem.paragraph)
end
