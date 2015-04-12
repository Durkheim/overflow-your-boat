class CommentsController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @comment = @question.comments.create(comment_params)
    @comment.update_attributes(commenter: current_user)
    redirect_to @question
  end
end
