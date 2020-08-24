require 'rails_helper'

RSpec.describe Category, type: :model do

  let(:cat) do 
    create(:category)
  end
  
  it 'is valid' do
    expect(cat).to be_valid
  end

  it 'is not valid without a name' do
    cat.name = nil
    expect(cat).to_not be_valid
  end

  it 'is invalid without an priority' do
    cat.priority = nil
    expect(cat).to_not be_valid
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:priority) }
  end

  describe 'Associations' do
    it { should have_many(:article_categories) }
    it { should have_many(:articles) }
  end
end