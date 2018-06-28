class QuestionsController < ApplicationController
  #before_action :authenticate_user!

  def index
    @questions = Question.all
    @user = current_user
    @recent_questions = Question.order(created_at: :desc).limit(10)
    @pop_questions = Question.order(favorites_count: :desc).limit(10)
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

  def favorite
    @question = Question.find(params[:id])
    @question.favorites.create!(user: current_user)
    redirect_back(fallback_location: question_path)  # 導回上一頁
  end

  def create
    #params.require(:question).permit(:description, :user_id)
    @user = current_user
    #@question = Tweet.new(question_params)
    @question = current_user.questions.build(question_params)

    if @question.save
      flash[:notice] = "question was successfully created"
    else
      flash[:alert] = "question was failed to create"
    end
    redirect_back(fallback_location: questions_path)
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :intro, :role, :image, :name)
    end

    def check_userself
      if current_user!=@user
      redirect_to restaurants_path
      flash[:alert] = "您無編輯權限！"
      end
    end

    def set_question
      @tweet = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit( :subject, :content, :user_id, :created_at, :updated_at)
    end

end
