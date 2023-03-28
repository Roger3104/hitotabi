# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
    email: 'hitotabi@admin',
    password: 'hitotabi'
)

User.create!(
        [
            {name: 'あどみん', email: 'admin@admin', password: 'hitotabi'},
            {name: 'イエスマン', email: 'yes@yes', password: 'hitotabi'},
            {name: 'Tom Hanks', email: 'tom@admin', password: 'hitotabi'},
            {name: '次元', email: 'jigen@jigen', password: 'hitotabi'},
            {name: 'ガンダルフ', email: 'ring@ring', password: 'hitotabi'},
        ]
    )

Category.create!(
        [
            {name: '景色', id: 1},
            {name: '季節', id: 2},
            {name: '自然', id: 3},
            {name: '気分', id: 4},
            {name: 'アクティビティ', id: 5},
            {name: '時間帯', id: 6},
            {name: '動物', id: 7},
        ]
    )

Tag.create!(
        [
            {name: '日の出', category_id: 1}, {name: '夕日', category_id: 1}, {name: '夜景', category_id: 1}, {name: '街', category_id: 1}, {name: '星空', category_id: 1}, {name: '花', category_id: 1}, {name: '草原', category_id: 1}, {name: '雪', category_id: 1},
            {name: '春', category_id: 2}, {name: '夏', category_id: 2}, {name: '秋', category_id: 2}, {name: '冬', category_id: 2},
            {name: '海', category_id: 3}, {name: '山', category_id: 3}, {name: '川', category_id: 3}, {name: '湖', category_id: 3}, {name: '池', category_id: 3},
            {name: '癒やし', category_id: 4}, {name: '感動', category_id: 4}, {name: 'ノスタルジー', category_id: 4}, {name: '爽快', category_id: 4}, {name: 'ワクワク', category_id: 4},
            {name: '散策', category_id: 5}, {name: 'サイクリング', category_id: 5}, {name: '山登り', category_id: 5}, {name: '釣り', category_id: 5}, {name: 'カヤック', category_id: 5},
            {name: '早朝', category_id: 6}, {name: '朝', category_id: 6}, {name: '昼', category_id: 6}, {name: '夕方', category_id: 6}, {name: '夜', category_id: 6},
            {name: '犬', category_id: 7}, {name: '猫', category_id: 7}, {name: '鳥', category_id: 7}, {name: '虫', category_id: 7},
        ]
    )

# Post.create!(
#   [
#     {title: 'ひまわりと風車', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample1.jpeg"), filename:"sample1.jpeg"), address: nil, latitude: nil, longitude: nil, status: "draft", date: nil, user_id: users[1].id },
#     {title: '今日の東京タワー', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/tokyo-min.jpg"), filename:"tokyo-min.jpg"), latitude: 35.6585805, longitude: 139.7454329, date: nil, content: nil, status: "draft", user_id: users[2].id },
#     {title: 'ぶどう園の犬', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/inu.jpeg"), filename:"inu.jpeg"), date: nil, status: "draft", user_id: users[3].id },
#   ]
# )