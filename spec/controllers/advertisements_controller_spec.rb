require 'rails_helper'
require 'random_data'

RSpec.describe AdvertisementsController, :type => :controller do
  let(:my_ad) { Advertisement.create!(title: RandomData.random_word, copy: RandomData.random_sentence, price: 10)}

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'renders the #index view' do
      get :index
      expect(response).to render_template :index
    end

    it 'renders my_ad' do
      get :index, {id: my_ad.id}
      expect(assigns[:advertisements]).to eq([my_ad])
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show, {id: my_ad.id}
      expect(response).to have_http_status(:success)
    end

    it 'renders #show view' do
      get :show, {id: my_ad.id}
      expect(response).to render_template(:show)
    end

    it 'shows my_ad' do
      get :show, {id: my_ad.id}
      expect(assigns(:advertisement)).to eq(my_ad)
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'renders #new view' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #create' do
    #
    #
    #
    # these are failing, need to add function to fix
    it 'increases the number of Post by 1' do
      expect{post :create, advertisement: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 10}}.to change(Advertisement,:count).by(1)
    end

    it 'assigns the new post to @post' do
      post :create, advertisement: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 10}
      expect(assigns(:advertisement)).to eq Advertisement.last
    end

    it 'redirects to the new post' do
      post :create, advertisement: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 10}
      expect(response).to redirect_to Advertisement.last
    end
    # end failing specs
    #
    #
    #


    it 'returns http success' do
      get :create, {id: my_ad.id}
      expect(response).to have_http_status(:success)
    end

    it 'renders #create view' do
      get :create, {id: my_ad.id}
      expect(response).to render_template(:create)
    end
  end

end
