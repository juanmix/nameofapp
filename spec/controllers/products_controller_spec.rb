require 'rails_helper'

describe ProductsController, type: :controller do
  context 'GET #index' do
    before do
      get :index
    end

    it 'responds succesfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end

  context 'POST #create' do
    before do
      @product = FactoryGirl.create(:product)
      post :create, product: @product
    end

    it 'redirects to product show' do
      expect(response).to redirect_to(@product)
    end
  end

  context 'PATCH #update' do
    before do
      @product = FactoryGirl.create(:product)
      patch :update, product: @product
    end

    it 'redirects to product show' do
      expect(response).to redirect_to(@product)
    end
  end

end