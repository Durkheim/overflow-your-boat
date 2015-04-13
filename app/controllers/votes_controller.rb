class VotesController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    if params[:answer_id] != nil
      @answer = Answer.find(params[:answer_id])
      if params[:like] == "true"
        @vote = @answer.votes.create(like: true)
      else
        @vote = @answer.votes.create(like: false)
      end
    redirect_to @question
    else
      if params[:like] == "true"
        @vote = @question.votes.create(like: true)
      else
        @vote = @question.votes.create(like: false)
      end
    redirect_to @question
    end
  end
end
