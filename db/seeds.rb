# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Role.create([{ name: 'User', level:  1},
                   { name: 'Sales Person', level: 2 },
                   { name: 'Sales Manager', level: 3 },
                   { name: 'Finance Manager', level:  4},
                   { name: 'Inventory Manager', level:  5},
                   { name: 'Dealership Owner', level:  6}
                  ])
