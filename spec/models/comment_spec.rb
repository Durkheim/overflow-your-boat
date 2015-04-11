require 'rails_helper'

describe Comment do

  context "when the comment is on a question" do
    let(:user) {User.create(username: "Test_User", email: "email@email.com", password: "password", location: "Chicago")}
    let(:question) {user.questions.create(title: "What is Travis CI?", description: "Seriously, what is it?")}
    let(:question_comment) {question.comments.create(message: "This is a comment on a question.", commenter: user)}

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
      let(:user) {User.create(username: "Test_User", email: "email@email.com", password: "password", location: "Chicago")}
      let(:answer) {Answer.create(content: "This is a sample answer! Lots of smart things here!", answerer: user)}
      let(:answer_comment) {answer.comments.create(message: "This is a comment on an answer.", commenter: user)}

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
