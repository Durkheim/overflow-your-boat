require 'rails_helper'
describe UsersController do
  let!(:user) {User.create(username: "Test_User", email: "email@email.com", password: "password", location: "Chicago")}

  describe "GET #index" do
    it "assigns all users as @users" do
      get :index, { id: user.to_param }
      expect(assigns(:users)).to eq([user])
    end
  end

  describe "GET #show" do
    it "assigns the requested user as @user" do
      get :show, { id: user.to_param }
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET #new" do
    it "renders the 'new' template" do
      get :new, {:user => { username: "Test_User", email: "email@email.com", password: "password", location: "Chicago" }}
      expect(response).to render_template(:new)
    end
  end

  describe "POST create" do
    context "when valid params are passed" do
      it "creates a new user" do
        expect do
        post :create, {:user => {username: "Test_User", email: "email@email.com", password: "password", location: "Chicago"}}
        end.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, {:user => {username: "Test_User", email: "email@email.com", password: "password", location: "Chicago"}}
        expect(assigns(:user)).to be_a(user)
      end

      it "redirects to the created user" do
        post :create, {:user => {username: "Test_User", email: "email@email.com", password: "password", location: "Chicago"}}
        expect(response).to redirect_to(User.last)
      end
    end

    context "when invalid params are passed" do
      it "assigns a newly created but unsaved user as @user" do
        allow_any_instance_of(User).to receive(:save).and_return(false)
        post :create, {:user => {foo: 'bar'}}
        expect(assigns(:user)).to be_a_new(User)
      end

      it "re-renders the 'new' template" do
        allow_any_instance_of(User).to receive(:save).and_return(false)
        post :create, {:user => {foo: 'bar'}}
        expect(response).to render_template(:new)
      end
    end
  end
end
