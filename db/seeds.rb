# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

a = Category.create!(title: "最新消息", parent_id: nil, on: true)
b = Category.create!(title: "新聞稿", parent_id: nil, on: true)
c = Category.create!(title: "闢謠專區", parent_id: nil, on: true)
videos = Category.create!(title: "影音記錄", parent_id: nil, on: true)
qa = Category.create!(title: "了解婚姻平權", parent_id: nil, on: true)
sub_qa1 = Category.create!(title: "議題一：為什麼修法爭議這麼大？", parent_id: qa.id, on: true)
sub_qa2 = Category.create!(title: "議題二：你真的了解同性戀嗎？", parent_id: qa.id, on: true)
sub_qa3 = Category.create!(title: "議題三：修法後的「家」是什麼模樣？", parent_id: qa.id, on: true)
Category.create!(title: "議題四：同性婚姻合法化，對下一代有負面影響嗎？", parent_id: qa.id, on: true)
Category.create!(title: "議題五：國際法裡的同性婚姻", parent_id: qa.id, on: true)

Article.create!(title: "密不動的畫喜智怎不上",
                description: "聲生原有新上裡為石，弟的選眼年傳。之推中投標出光了子。別改住們",
                content: "<h2>密不動的畫喜智怎不上</h2><p>聲生原有新上裡為石，弟的選眼年傳。之推中投標出光了子。別改住們異、師開朋打密麼裡、自國終不招，報火家舉成才麼木的好考一像前居師股海醫交全也，書響他使經像就放大，汽及我供常前場合邊一現查？</p><p>人健春有就有起，我可表；各通邊性細以不？這太路們良度、在作在證！媽居的比的達意度提筆！</p><p>裡帶一公由分文慢回生下給司自覺生上更下賽人，意通發意希同不維；量別飛成這、旅臺有醫道存，們溫從&hellip;&hellip;目升物，果愛名道，木是對少們品體這景：的我許，識觀情一傳的政位制果部安了人北加同頭為港？評地家司會好友數青一任合，平查然洋爾機魚命小奇團總管我可團老們變內有他過備種國一思只我富公就再腦動達現好何品的一確發縣國間；臺二的理，水們魚使為子。邊營引！否過奇毒出認內利從子決發而！明痛如，能飛大那明真老不這，面們我保以那顯海沒新戰牛這設了美竟土持家小喜。</p><p>路問創大說我國直散在表選是！所重目發由看告人我間兒望樹值時主利在汽北中得來下真；們調表字回傷來中所教見&hellip;&hellip;究種遊媽全食了行然裡子。</p>",
                on: true,
                front_page_pinned: true,
                category_id: a.id,
                remote_main_pic_url: "http://vignette3.wikia.nocookie.net/legendsofthemultiuniverse/images/0/00/Pikachu_tough.png/revision/latest?cb=20140701061932",
                admin_user_id: 1)

Article.create!(title: "士就國計我我屋得",
                description: "定復爭背代物大，八值大他天財議治、弟積哥日年",
                content: "<h2>密不動的畫喜智怎不上</h2>
<p>聲生原有新上裡為石，弟的選眼年傳。之推中投標出光了子。別改住們異、師開朋打密麼裡、自國終不招，報火家舉成才麼木的好考一像前居師股海醫交全也，書響他使經像就放大，汽及我供常前場合邊一現查？</p>
<p>人健春有就有起，我可表；各通邊性細以不？這太路們良度、在作在證！媽居的比的達意度提筆！</p>
<p>裡帶一公由分文慢回生下給司自覺生上更下賽人，意通發意希同不維；量別飛成這、旅臺有醫道存，們溫從&hellip;&hellip;目升物，果愛名道，木是對少們品體這景：的我許，識觀情一傳的政位制果部安了人北加同頭為港？評地家司會好友數青一任合，平查然洋爾機魚命便小奇團總管我可團老們變內有他過備種國一思只我富公就再腦動達現好何品的一確發縣國間；臺二的理，水們魚使為子。邊營引！否過奇毒出認內利從子決發而！明痛如，能飛大那明真老不這，面們我保以那顯海沒新戰牛這設了美竟土持家小喜。</p>
<p>路問創大說我國直散在表選是！所重目發由看告人我間兒望樹值時主利在汽北中得來下真；們調表字回傷來中所教見&hellip;&hellip;究種遊媽全食了行然裡子。</p>
",
                on: true,
                pinned: true,
                front_page_pinned: true,
                category_id: b.id,
                remote_main_pic_url: "http://vignette2.wikia.nocookie.net/pokemon/images/c/c5/Ash_Pikachu_Leer_EP009.png/revision/latest?cb=20170224055122",
                admin_user_id: 1)

Article.create!(title: "原蘭世合高天深收外",
                description: "另庭年而們出你用時回市們人聲前只它公，與無因。",
                content: "<h2>密不動的畫喜智怎不上</h2>
<p>聲生原有新上裡為石，弟的選眼年傳。之推中投標出光了子。別改住們異、師開朋打密麼裡、自國終不招，報火家舉成才麼木的好考一像前居師股海醫交全也，書響他使經像就放大，汽及我供常前場合邊一現查？</p>
<p>人健春有就有起，我可表；各通邊性細以不？這太路們良度、在作在證！媽居的比的達意度提筆！</p>
<p>裡帶一公由分文慢回生下給司自覺生上更下賽人，意通發意希同不維；量別飛成這、旅臺有醫道存，們溫從&hellip;&hellip;目升物，果愛名道，木是對少們品體這景：的我許，識觀情一傳的政位制果部安了人北加同頭為港？評地家司會好友數青一任合，平查然洋爾機魚命便小奇團總管我可團老們變內有他過備種國一思只我富公就再腦動達現好何品的一確發縣國間；臺二的理，水們魚使為子。邊營引！否過奇毒出認內利從子決發而！明痛如，能飛大那明真老不這，面們我保以那顯海沒新戰牛這設了美竟土持家小喜。</p>
<p>路問創大說我國直散在表選是！所重目發由看告人我間兒望樹值時主利在汽北中得來下真；們調表字回傷來中所教見&hellip;&hellip;究種遊媽全食了行然裡子。</p>
",
                on: true,
                pinned: true,
                front_page_pinned: true,
                category_id: c.id,
                remote_main_pic_url: "https://cdn1.vox-cdn.com/uploads/chorus_asset/file/6146267/pikachu_wide.0.jpg",
                admin_user_id: 1)

Video.create!(title: "候狀告園漸聽那演！是久加同：願",
                description: "民打是著有的管她標人太真著來集，統以之你一、指力是示開不變見完代使了書嚴備主們高題面清類國一政",
                on: true,
                video: "https://www.youtube.com/watch?v=FUXMqninXK0",
                category_id: videos.id,
                remote_main_pic_url: "https://typeset-beta.imgix.net/rehost%2F2016%2F9%2F14%2F3bddb9fb-8417-42bd-ad68-483047679620.png",
                admin_user_id: 1)

Question.create!(title: "有們機一告領河灣病的",
                content: "品刻民如表發前友報海出司復……重我想的思、科大！

究們爸發。中報風讀是沒件要……叫同日後可著溫然服，人身廣角基生的到的輕始愛是過和後最標內因童知我何常回政就，東成續球廠現她解原期書得自緊視高便，不機象決國明道。為隨經人辦麗，了我提整方社下同的馬如要流我結……受益子中意想此兒化能功類靈香展全線方我資長東怎後亞雄腳，備分使如北養中基什技主中香一另小：個個推身，兩人小高這指問比海態多麗外現驗始起是兒日價天萬登區小水：成員吸，散孩軍站影，集戰究臺學到後開情人……領星時他要；參及獎……熱使而意路停夜更風，想道王年講準車，象我該新母國健黨益提一聲，決主部不員我收的是：成院合本直風把配感論、喜老特好年景去帶報經了前？工去卻洲力顯一石機直，新紅沒子交可的我族人母有的男後顧試綠火聲，異山大，黑他解速很但過成家人司也們現真子：聲照！

畫果毒數買受顧病到指程成人了會作謝散法表業成些客到眼造，說美斯果足。於得子，會此到立家演不片雜會千來我當。",
                on: true,
                video: "https://www.youtube.com/watch?v=FUXMqninXK0",
                category_id: sub_qa1.id,
                admin_user_id: 1)

Question.create!(title: "著清不的問",
                content: "育個王業出它廣望玩雜源的師體時生。論小大最本己著陽反點解響作導該說先所推廣的社大我有深，隨我總以裡眾會：我只社慢？收到美面、了人密岸：好有具足一是今成市生平電制新備資前住要部大情！及約學法一的何價治：影師對中提機小體國！白會適打壓運！我一實只，萬何必面總月時地轉是……得紀自器子灣很公我解；是投感己她理指。呢家投夫先優在國幾毒美葉！",
                on: true,
                video: "https://www.youtube.com/watch?v=FUXMqninXK0",
                category_id: sub_qa2.id,
                admin_user_id: 1)

Question.create!(title: "有們機一告領河灣病的",
                content: "品刻民如表發前友報海出司復……重我想的思、科大！
究們爸發。中報風讀是沒件要……叫同日後可著溫然服，人身廣角基生的到的輕始愛是過和後最標內因童知我何常回政就，東成續球廠現她解原期書得自緊視高便，不機象決國明道。為隨經人辦麗，了我提整方社下同的馬如要流我結……受益子中意想此兒化能功類靈香展全線方我資長東怎後亞雄腳，備分使如北養中基什技主中香一另小：個個推身，兩人小高這指問比海態多麗外現驗始起是兒日價天萬登區小水：成員吸，散孩軍站影，集戰究臺學到後開情人……領星時他要；參及獎……熱使而意路停夜更風，想道王年講準車，象我該新母國健黨益提一聲，決主部不員我收的是：成院合本直風把配感論、喜老特好年景去帶報經了前？工去卻洲力顯一石機直，新紅沒子交可的我族人母有的男後顧試綠火聲，異山大，黑他解速很但過成家人司也們現真子：聲照！
畫果毒數買受顧病到指程成人了會作謝散法表業成些客到眼造，說美斯果足。於得子，會此到立家演不片雜會千來我當。",
                on: true,
                video: "https://www.youtube.com/watch?v=FUXMqninXK0",
                category_id: sub_qa3.id,
                admin_user_id: 1)
