require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:reply) do
    build(:comment)
  end

  it 'is valid' do
    expect(reply).to be_valid
  end

  it 'is invalid without a content' do
    reply.content = nil
    expect(reply).to_not be_valid
  end

  it 'is valid with characters less than 150' do
    reply.content = 'a' * 49
    expect(reply).to be_valid
  end

  it 'is invalid with characters greater than 150' do
    reply.content = 'a' * 151
    expect(reply).to_not be_valid
  end

  describe 'Validations' do
    it { should validate_presence_of(:content) }
    it { should validate_length_of(:content) }
  end

  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:article) }
  end
end
