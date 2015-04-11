require 'rails_helper'

describe Answer do
  let(:user) {User.create(username: "Test_User", email: "email@email.com", password: "password", location: "Chicago")}
  let(:question) {user.questions.create(title: "What is Travis CI?", description: "Seriously, what is it?")}
  let(:answer) {question.answers.create(content: "This is a sample answer! Lots of smart things here!", answerer: user)}

  it "should have content" do
    expect(answer.content).to eq("This is a sample answer! Lots of smart things here!")
  end

  it "should belong to a question" do
    expect(answer.question).to eq(question)
  end

  it "should belong to an answerer" do
    expect(answer.answerer).to eq(user)
  end

end
