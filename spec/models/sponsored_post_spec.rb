require 'rails_helper'
require 'random_data'

RSpec.describe SponsoredPost, :type => :model do
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)}

  let(:sponsored_post) { topic.sponsored_posts.create!(title: RandomData.random_word, body: RandomData.random_paragraph, price: rand(5..50)) }

  it { is_expected.to belong_to :topic}

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_presence_of(:price) }

  it { is_expected.to validate_length_of(:title).is_at_least(3) }
  it { is_expected.to validate_length_of(:body).is_at_least(20) }


  describe 'attributes' do
    it 'responds to title' do
      expect(sponsored_post).to respond_to(:title)
    end

    it 'responds to body' do
      expect(sponsored_post).to respond_to(:body)
    end

    it 'responds to price' do
      expect(sponsored_post).to respond_to(:price)
    end
  end
end
