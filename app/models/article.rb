class Article < ApplicationRecord
  validates_presence_of :title, :text
  mount_uploader :image, ImageUploader
  belongs_to :author, class_name: 'User'
end
