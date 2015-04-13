class QuestionsController < ApplicationController

  def index
    @questions = Question.all
    @questions = @questions.sort_newest if params[:sort] == "newest"
    @question = Question.new

  end

  def show
    @question = Question.find(params[:id])
    @answers_for_question = Answer.all.where(question_id: @question.id)
    @answer = Answer.new
    @comment = Comment.new
    @comments_on_question = @question.comments
    @vote = Vote.new
    @votes_on_question = @question.votes



    # @comments_on_answer
  end

  def create
    if current_user
      @question = current_user.questions.new(question_params)
      if @question.save
        redirect_to @question
      else
        render "index"
      end
    else
      flash[:failure] = "Must be logged in to perform this action"
      redirect_to questions_path
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update_attributes(question_params)
    if @question.save
      redirect_to @question
    else
      render "edit"
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to user_path(current_user)
  end

  private

    def question_params
      params.require(:question).permit(:title, :description)
    end

end
