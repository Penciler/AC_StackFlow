namespace :dev do
  # 請先執行 rails dev:fake_question，可以產生 20 個資料完整的 User 紀錄
  # 其他測試用的假資料請依需要自行撰寫
  task fake_question: :environment do
    #User.destroy_all
    20.times do |i|
      name = FFaker::Name::first_name
      #file = File.open("#{Rails.root}/public/avatar/question#{i+1}.jpg")

      question = Question.new(
        subject: name,          
        user_id: rand(20),      
        content: FFaker::Lorem::sentence(30),        
      )

      question.save!
      puts question.subject
    end
  end

  task fake_tweet: :environment do

    @questions = User.all
    @questions.each do |question|
      3.times do |i|
        Tweet.create!(description: FFaker::Lorem.characters(character_count = 50),
          question_id: question.id,
        )
      end
    end
    puts "have created fake tweets"
    puts "now you have #{Tweet.count} comments data"
  end

end
