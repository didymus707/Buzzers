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

  it 'is valid with a character less than 50' do
    reply.content = 'a' * 49
    expect(reply).to be_valid
  end

  it 'is invalid with a character greater than 50' do
    reply.content = 'a' * 51
    expect(reply).to_not be_valid
  end

  describe 'Validations' do
    it { should validate_length_of(:content) }
  end

  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:article) }
  end
end
