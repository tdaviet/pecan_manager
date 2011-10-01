Factory.define :company do |company|
  company.name        "John Doe Farms"
end

# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                  "Michael Hartl"
  user.email                 "mhartl@example.com"
  user.user_password              "foobar"
  user.user_password_confirmation "foobar"
  user.association :company
end

