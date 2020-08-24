FactoryBot.define do
  factory :user, aliases: [:author] do
    name { "John Doe" }
    username { "jodi" }
  end

  factory :article, aliases: [:articles] do
    author factory: :user
    title { "The Beatles" }
    image  { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/suarez.jpg'))) }
    text { 'The beatles were legendry musicians known for great music' }
  end

  factory :category do
    articles factory: :user
    name { 'Sports' }
    priority { 1 }
  end
end