require 'rails_helper'
require 'carrierwave/test/matchers'

RSpec.describe Article, type: :model do
  # include CarrierWave::Test::Matchers

  art = FactoryBot.build(:article)

  it 'is valid' do
    expect(art).to be_valid
  end

  it 'is not valid without a title' do
    art.title = nil
    expect(art).to_not be_valid
  end

  it 'is invalid without an text' do
    art.text = nil
    expect(art).to_not be_valid
  end

  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:text) }
  end

  describe 'Associations' do
    it { should belong_to(:author) }
    it { should have_many(:article_categories) }
    it { should have_many(:categories) }
    it { should have_many(:comments) }
  end
end
