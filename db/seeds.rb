# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Role.create([{ name: 'User', level:  1},
                   { name: 'Sales person', level: 2 },
                   { name: 'Sales manager', level: 3 },
                   { name: 'Finance manager', level:  4},
                   { name: 'Inventory manager', level:  5},
                   { name: 'Dealership owner', level:  6}
                  ])
