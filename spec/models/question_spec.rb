require 'rails_helper'

user = FactoryGirl.build(:user)
question = FactoryGirl.build(:question, user: user)

describe Question do

  it "should have a title" do
    expect(question.title).to eq("What is Travis CI?")
  end

  it "should have a description" do
    expect(question.description).to eq("Seriously, what is it?")
  end

  it "should belong to a user" do
    expect(question.user.username).to eq("Test_User")
  end

end
