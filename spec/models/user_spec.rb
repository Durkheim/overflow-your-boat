require 'rails_helper'

describe User do
  let(:user) {User.create(username: "Test_User", email: "email@email.com", password: "password", location: "Chicago")}

  describe "#username" do
    it "should have a unique username" do
      expect(user.username).to eq("Test_User")
    end

    it "should not accept a username that is not unique" do
      user = User.create(username: "Test_User", email: "email@email.com", password: "password", location: "Chicago")
      user_two = User.create(username: "Test_User", email: "email_two@email.com", password: "password", location: "Chicago")
      expect(user_two.id).to eq nil
    end
  end

  describe "#email" do
    it "should have a unique email" do
      expect(user.email).to eq("email@email.com")
    end

    it "should not accept an email that is not unique" do
      user = User.create(username: "Test_User", email: "email@email.com", password: "password", location: "Chicago")
      user_two = User.create(username: "Test_User_Two", email: "email@email.com", password: "password", location: "Chicago")
      expect(user_two.id).to eq nil
    end

    it "should only accept an email with proper formatting" do
      user = User.create(username: "Test_User", email: "emailemail.com", password: "password", location: "Chicago")
      expect(user.id).to eq nil
    end

  end

  # describe "#password_digest" do
  #   it "should have a secure password" do
  #     expect(user.password).to_not eq("password")
  #   end
  # end

end
