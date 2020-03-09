# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# -------------------------------------------
# Fakerを日本語化する
Faker::Config.locale = :ja

# 指定した文字数の文字列を生成する
def create_caption(number)
  Faker::Lorem.characters(number: number)
end
# -------------------------------------------

# user
profiles = [
  { email: "kensei@example.com",  name: "kensei359",                caption: create_caption(150) },
  { email: "tonakai@example.com", name: "yukigeshiki_hokkaido_123", caption: create_caption(90) },
  { email: "tomy@example.com",    name: "tomy_tomy",                caption: create_caption(124) },
]

profiles.each do |profile|
  User.find_or_create_by!(email: profile[:email]) do |user|
    user.email = profile[:email]
    user.name = profile[:name]
    user.caption = profile[:caption]
    user.password = "password"
  end
end
# user/

