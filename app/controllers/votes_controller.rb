class VotesController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    if params[:vote][:like] == "true"
      @vote = @question.votes.create(like: true)
    else
      @vote = @question.votes.create(like: false)
    end
    redirect_to @question
  end
end
