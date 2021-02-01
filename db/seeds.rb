# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create({"points" => 680, "email" => "pedro@flourishsavings.com", "balance" => 600})
User.create({"points" => 685, "email" => "nadilson@flourishsavings.com", "balance" => 610})
User.create({"points" => 690, "email" => "enrique@flourishsavings.com", "balance" => 620})