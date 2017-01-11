require 'rails_helper'

describe UsersController, type: :controller do

    let(:user1) { FactoryGirl.create(:user) }
    let(:user2) { FactoryGirl.create(:user) }
    # Now @user will be generated from the factory :user
    # before: User.create!(email: "pedro@example.com", password: "password")

  describe 'GET #show' do

    context 'User is logged in' do
      before do
        sign_in user1
      end

      it 'loads correct user details' do
        get :show, id: user1.id

        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq user1 # we expect the assigned :user to equal the user we created (user).
      end

      it 'redirects to root_path if trying to access a different user' do
        get :show, id: user2.id # user1 signed in before (in before block) and tries to get show page of user1.
        expect(response).to redirect_to(root_path)
      end

    end

    context 'No user is logged in' do
      it 'redirects to login' do # this time we don't add the before block with sign_in user1
        get :show, id: user1.id  # a show page always needs an ID so we know which show page to access
        expect(response).to redirect_to(root_path)
      end
    end

  end

end