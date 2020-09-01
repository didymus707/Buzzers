FactoryBot.define do
  factory :user, aliases: [:author] do
    name { 'John Doe' }
    username { 'jodi' }
  end

  factory :article do
    author factory: :user
    title { 'Suarez' }
    image { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, './spec/fixtures/messi.png'))) }
    text { 'The former Liverpool player is about to be sold' }
  end

  factory :category do
    name { 'Sports' }
    priority { 1 }
  end

  factory :comment do
    article
    user
    content { 'One of the greatest strikers to ever play the game' }
  end
end
