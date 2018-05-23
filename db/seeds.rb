# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

carlos = User.create(name: 'carlos', email: 'ctalvarez@uc.cl', password: '123456', role: 1)

projects = FactoryBot.create_list(:project, 10, user: carlos)

FactoryBot.create_list(:tag, 10)

# FactoryBot.create_list(:reward, 3, project: projects[])
