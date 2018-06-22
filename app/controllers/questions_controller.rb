class QuestionsController < ApplicationController
  #before_action :authenticate_user!

  def index
    @questions = Question.all
    @user = current_user
    @recent_questions = Question.order(created_at: :desc).limit(10)
    @pop_questions = Question.order(likes_count: :desc).limit(10)
    @question = Question.new
    #@users # 基於測試規格，必須講定變數名稱，請用此變數中存放關注人數 Top 10 的使用者資料
  end

  def show
    @question = Question.find(params[:id])
    @question.answers.each do |answer|
      answer.upvotes_count = answer.answer_upvotes.count
      answer.save!
    end
    @pop_answers = @question.answers.order(upvotes_count: :desc)
    @answer = Answer.new
  end

end
