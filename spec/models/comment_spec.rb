require 'rails_helper'

user = FactoryGirl.build(:user)
question = FactoryGirl.build(:question, user: user)
question_comment = FactoryGirl.build(:question_comment, commenter: user, response: question)
answer = FactoryGirl.build(:answer, answerer: user)
answer_comment = FactoryGirl.build(:answer_comment, commenter: user, response: answer)

describe Comment do

  context "when the comment is on a question" do
    it "should have a message" do
      expect(question_comment.message).to eq("This is a comment on a question.")
    end

    it "should belong to a question" do
      expect(question_comment.response).to eq(question)
    end

    it "should belong to a commenter" do
      expect(question_comment.commenter).to eq(user)
    end
  end

    context "when the comment is on an answer" do
      it "should have a message" do
      expect(answer_comment.message).to eq("This is a comment on an answer.")
    end

      it "should belong to a answer" do
      expect(answer_comment.response).to eq(answer)
    end

     it "should belong to a commenter" do
      expect(answer_comment.commenter).to eq(user)
    end
    end
end
