# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "管理人A", faculty: "教務課",admin: true,student_id: "adminA",password: "admin",password_confirmation: "admin",grade: 2)
User.create!(name: "syamu_game", faculty: "ネットワーク情報学部", admin: false, student_id: "ne0",password: "0",password_confirmation: "0", grade: 3)
