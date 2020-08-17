class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  mount_uploader :image, ImageUploader
  has_many :article_categories
  has_many :categories, through: :article_categories

  validates_presence_of :title, :text
  validates_presence_of :image
  
end
