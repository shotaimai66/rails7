# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Admin.create(email: 'admin@example.com', password: 'password')
Manager.create(email: 'admin@example.com', password: 'password')
User.create(email: 'admin@example.com', password: 'password')


100.times do |n|
  Book.create(
    title: "タイトル-#{n}",
    author: "作者-#{n}",
    publisher: "出版社-#{n}",
    published_on: DateTime.now,
    series: "シリーズ-#{n}",
    page_size: n
  )
end