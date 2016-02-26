require 'rails_helper'
require 'random_data'

RSpec.describe AdvertisementsController, :type => :controller do
  let(:my_ad) { Advertisement.create!(title: RandomData.random_word, copy: RandomData.random_sentence, price: rand(1..10))}

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'renders the #index view' do
      get :index
      expect(response).to render_template :index
    end

    #
    # is this test necessary?
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
    let(:new_ad) { Advertisement.create!(title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: rand(1..10))}

    it 'increases the number of Post by 1' do
      expect{new_ad}.to change(Advertisement, :count).by(1)
    end

    it 'assigns the new advertisement to @advertisement' do
      expect(assigns(:new_ad)).to eq Advertisement.last
    end

    #
    #
    #
    # this is failing, need to get to pass
    it 'redirects to the new post' do
      Advertisement.create!(title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: rand(1..10))

      expect(response).to redirect_to Advertisement.last
    end
    # end failing specs
    #
    #
    #

  end

end
