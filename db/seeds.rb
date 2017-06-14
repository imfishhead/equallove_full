# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

Category.create!(title: "最新消息", parent_id: nil, on: true)
Category.create!(title: "新聞稿", parent_id: nil, on: true)
Category.create!(title: "闢謠專區", parent_id: nil, on: true)
Category.create!(title: "影音記錄", parent_id: nil, on: true)
qa = Category.create!(title: "了解婚姻平權", parent_id: nil, on: true)
Category.create!(title: "議題一：為什麼修法爭議這麼大？", parent_id: qa.id, on: true)
Category.create!(title: "議題二：你真的了解同性戀嗎？", parent_id: qa.id, on: true)
Category.create!(title: "議題三：修法後的「家」是什麼模樣？", parent_id: qa.id, on: true)
Category.create!(title: "議題四：同性婚姻合法化，對下一代有負面影響嗎？", parent_id: qa.id, on: true)
Category.create!(title: "議題五：國際法裡的同性婚姻", parent_id: qa.id, on: true)
