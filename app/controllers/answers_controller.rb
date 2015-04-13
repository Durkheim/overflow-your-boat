class AnswersController < ApplicationController

  def create
    if current_user
      @question = Question.find(params[:question_id])
      @answer = @question.answers.create(answer_params)
      @answer.update_attributes(answerer: current_user)
      redirect_to @question
    else
      @question = Question.find(params[:question_id])
      flash[:failure] = "Must be logged in to perform this action"
      redirect_to @question
    end
  end

  def edit
    if current_user
      @question = Question.find(params[:question_id])
      @answer = Answer.find(params[:id])
    else
      @question = Question.find(params[:question_id])
      flash[:failure] = "Must be logged in to perform this action"
      redirect_to @question
    end
  end

   def update
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.update_attributes(answer_params)
    if @answer.save
      redirect_to @question
    else
      render "edit"
    end
  end

    def destroy
      if current_user
        @question = Question.find(params[:question_id])
        @answer = @question.answers.find(params[:id])
        @answer.destroy
        redirect_to @question
      else
        @question = Question.find(params[:question_id])
        flash[:failure] = "Must be logged in to perform this action"
        redirect_to @question
      end
    end


  private

    def answer_params
      params.require(:answer).permit(:content)
    end

end
