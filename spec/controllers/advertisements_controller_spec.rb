require 'rails_helper'

RSpec.describe AdvertisementsController, :type => :controller do
  let(:my_ad) { Advertisement.create!(title: 'Nyew Ad', copy: 'Advertisement copy', price: 10)}

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'renders the #index view' do
      get :index
      expect(response).to render_template :index
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

  describe 'GET #edit' do
    it 'returns http success' do
      get :edit, {id: my_ad.id}
      expect(response).to have_http_status(:success)
    end

    it 'renders #edit view' do
      get :edit, {id: my_ad.id}
      expect(response).to render_template(:edit)
    end
  end

end
