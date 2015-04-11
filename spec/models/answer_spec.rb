require 'rails_helper'

user = FactoryGirl.build(:user)
question = FactoryGirl.create(:question, user: user)
answer = FactoryGirl.create(:answer, answerer: user, question_id: question.id)

describe Answer do

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
