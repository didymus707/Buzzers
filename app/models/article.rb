class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  mount_uploader :image, ImageUploader

  validates_presence_of :title, :text
  validates_presence_of :image
  
end
