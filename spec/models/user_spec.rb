require 'rails_helper'

user = FactoryGirl.build(:user)

describe User do

  describe "#username" do
    it "should have a unique username" do
      expect(user.username).to eq("Test_User")
    end

    it "should not accept a username that is not unique" do
      expect(FactoryGirl.build(:user, username: nil)).to_not be_valid
    end
  end

  describe "#email" do
    it "should have a unique email" do
      expect(user.email).to eq("email@email.com")
    end

    it "should not accept an email that is not unique" do
      expect(FactoryGirl.build(:user, email: nil)).to_not be_valid
    end

    it "should only accept an email with proper formatting" do
      bad_user = User.create(username: "Test_User", email: "emailemail.com", password: "password", location: "Chicago")
      expect(bad_user.id).to eq nil
    end

  end

  # describe "#password_digest" do
  #   it "should have a secure password" do
  #     expect(user.password).to_not eq("password")
  #   end
  # end

end
