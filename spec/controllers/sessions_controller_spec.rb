require 'rails_helper'

describe SessionsController do
  let!(:user) {User.create(username: "Test_User", email: "email@email.com", password: "password", location: "Chicago")}

  describe "POST #create" do
    context "when password is correct" do
      it "assigns the requested user as user" do
        user = User.create(username: "Test_User", email: "email@email.com", password: "password", location: "Chicago")
        post :create, { id: user.id  }
        expect(assigns(:user)).to be_a(User)
      end

      it "redirects to user page if password is correct" do
        post :create, {:user => {username: "Test_User", email: "email@email.com", password: "password", location: "Chicago"}}
        expect(response).to redirect_to(user_path(user))
      end
    end

    context "when password is incorrect" do
      it "assigns the requested user as @user" do
        allow_any_instance_of(User).to receive(:save).and_return(false)
        post :create, {:user => {username: "Test_User", password: 'bar'}}
        expect(assigns(:user)).to be_a_new(User)
      end

      it "re-renders the 'new' template" do
        allow_any_instance_of(User).to receive(:save).and_return(false)
        post :create, {:user => {username: "Test_User", password: 'bar'}}
        expect(response).to render_template(:new)
      end
    end
  end
end
