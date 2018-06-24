# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

carlos = User.create(name: 'carlos', email: 'ctalvarez@uc.cl', password: '123456', role: 'normal')
louise = User.create(name: 'louise', email: 'louise@uc.cl', password: '123456', role: 'normal')
rodolfo = User.create(name: 'rodolfo', email: 'rodolfo@uc.cl', password: '123456', role: 'normal')
admin = User.create(name: 'admin', email: 'admin@uc.cl', password: '123456', role: 'admin')

projects = FactoryBot.create_list(:project, 3, user: carlos, status: 'running')

# pending projects
pending_projects1 = FactoryBot.create_list(:project, 3, user: louise, status: 'pending')
pending_projects2 = FactoryBot.create_list(:project, 3, user: rodolfo, status: 'pending')

projects = FactoryBot.create_list(:project, 10, user: carlos)

FactoryBot.create_list(:tag, 10)

# FactoryBot.create_list(:reward, 3, project: projects[])
