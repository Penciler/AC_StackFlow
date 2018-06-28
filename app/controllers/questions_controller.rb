class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @questions = Question.all
    @user = current_user
    @recent_questions = Question.order(created_at: :desc).limit(10)
    @pop_questions = Question.order(likes_count: :desc).limit(10)
    
    # @users # 基於測試規格，必須講定變數名稱，請用此變數中存放關注人數 Top 10 的使用者資料
    @question = Question.new # 新 question_form 使用
  end

  def create
    @user = current_user
    @question = @user.questions.build(question_params)
    
    if @question.save
      flash[:notice] = 'question was successfully created'
      redirect_to questions_path

    else
      @questions = Question.all
      render :index
    end
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

  private

  def question_params
    params.require(:question).permit(:subject,:content)
  end
end
