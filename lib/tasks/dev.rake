namespace :dev do

  task all: [:fake_user, :fake_question, :fake_favorite, :fake_answer, :fake_answer_upvote, :fake_question_upvote]

  task fake_user: :environment do
    User.destroy_all

    20.times do
      User.create!(
        name:  FFaker::Name.first_name,
        email: FFaker::Internet.unique.email,      
        password: '12345678',
        company: FFaker::Company.name,
        title: FFaker::Job.title,
        website: FFaker::Internet.http_url,
        twitter: FFaker::Internet.http_url,
        github: FFaker::Internet.http_url

      )
    end
    puts 'have created fake users'
    puts "now you have #{User.count} users data"
  end

  task fake_question: :environment do
    Question.destroy_all
    10.times do
      Question.create!(
        subject: FFaker::Lorem.sentence,
        content: FFaker::Lorem.paragraph,
        user_id: User.all.sample.id
      )
    end
    puts 'have created fake questions'
    puts "now you have #{Question.count} questions data"
  end

  task fake_favorite: :environment do
    Favorite.destroy_all
    Question.all.each do |question|
      rand(10).times do
        question.favorites.create!(
          user_id: User.all.sample.id,
          question_id: question.id
        )
      end
    end
    puts 'have created fake question favorties'
    puts "now you have #{Favorite.count} Question favorties data"
  end

  task fake_answer: :environment do
    Answer.destroy_all
    Question.all.each do |question|
      2.times do
        question.answers.create!(
          content: FFaker::Lorem.paragraph,
          user_id: User.all.sample.id
        )
      end
    end
    puts 'have created fake answers'
    puts "now you have #{Answer.count} Answer data"
  end

  task fake_answer_upvote: :environment do
    AnswerUpvote.destroy_all
    Answer.all.each do |answer|
      rand(5).times do
        answer.answer_upvotes.create!(
          user_id: User.all.sample.id,
          answer_id: answer.id
        )
      end
    end
    puts 'have created fake answer upvotes'
    puts "now you have #{AnswerUpvote.count} Answer upvotes data"
  end

  task fake_question_upvote: :environment do
    QuestionUpvote.destroy_all
    Question.all.each do |question|
      3.times do
        question.question_upvotes.create!(
          user_id: User.all.sample.id,
          question_id: question.id
        )
      end
    end
    puts 'have created fake question upvotes'
    puts "now you have #{QuestionUpvote.count} Question upvotes data"
  end
end