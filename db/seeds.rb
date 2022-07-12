# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

[{ email: 'rita@gmail.com', name: 'Rita', pronoun: 'She/Her/Hers' }].each do |user|
  UserWorkspace.create!(
    user: User.new(**user.merge(password: '123456', password_confirmation: '123456')),
    workspace: Workspace.new(name: 'My Awesome Workspace'),
  )
end
