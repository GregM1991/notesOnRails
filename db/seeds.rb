# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
    email: "andrew@email.com",
    password: "password"
)
User.create(
    email: "greg@email.com",
    password: "password"
)
User.create(
    email: "adam@email.com",
    password: "password"
)

allusers=User.all

for user in allusers
    Notebook.create(
        title: "abc",
        user:user
    )
end

allnotebooks=Notebook.all
for notebook in allnotebooks
    Note.create(
        title: "def",
        body:"ghi",
        notebook:notebook
    )

end
