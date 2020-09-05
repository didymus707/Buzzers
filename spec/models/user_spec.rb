require 'rails_helper'

RSpec.describe User, type: :model do
  let(:u) do
    User.create(id: 1, name: 'Jane Doe', username: 'jodi')
  end

  it 'is valid' do
    expect(u).to be_valid
  end

  it 'is not valid without a name' do
    u.name = nil
    expect(u).to_not be_valid
  end

  it 'is not valid with a name less than 3' do
    u.name = 'a' * 2
    expect(u).to_not be_valid
  end

  it 'is valid with a name longer than 3' do
    u.name = 'a' * 4
    expect(u).to be_valid
  end

  it 'is invalid without an username' do
    u.username = nil
    expect(u).to_not be_valid
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:username) }
  end

  describe 'Associations' do
    it { should have_many(:articles) }
    it { should have_many(:comments) }
  end
end
