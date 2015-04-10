require 'rails_helper'

describe Question do
  let(:user) {User.create(username: "Test_User", email: "email@email.com", password: "password", location: "Chicago")}
  let(:question) {user.questions.create(title: "What is Travis CI?", description: "Seriously, what is it?")}

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
