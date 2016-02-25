require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe 'Get index' do
    it 'should render the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'Get about' do
    it 'should render the about template' do
      get :about
      expect(response).to render_template('about')
    end
  end

  describe 'Get faq' do
    it 'should render the faq template' do
      get :faq
      expect(response).to render_template('faq')
    end
  end

  describe 'Get Contact' do
    it 'should render the contact template' do
      get :contact
      expect(response).to render_template('contact')
    end
  end

end
