class CommentsController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    if params[:answer_id]
      @answer = Answer.find(params[:answer_id])
      @comment = @answer.comments.create(comment_params)
      @comment.update_attributes(commenter: current_user)
      redirect_to @question
    else
      @comment = @question.comments.create(comment_params)
      @comment.update_attributes(commenter: current_user)
      redirect_to @question
    end
  end
end


private

def comment_params
  params.require(:comment).permit(:message)
end
