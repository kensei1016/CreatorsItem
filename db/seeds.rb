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

# users
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
# users/

# creator_genres
creator_genre_datas = [
  { name: "音楽",  name_en: "music"},
  { name: "絵",  name_en: "illustrator"},
  { name: "料理",  name_en: "cooking"},
  { name: "プログラマー",  name_en: "programer"},
  { name: "写真",  name_en: "photogreper"}
]
creator_genre_datas.each do |creator_genre_data|
  CreatorGenre.find_or_create_by!(name: creator_genre_data[:name]) do |creator_genre|
    creator_genre.name = creator_genre_data[:name]
    creator_genre.name_en = creator_genre_data[:name_en]
  end
end
# creator_genres/
