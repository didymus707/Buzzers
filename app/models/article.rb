class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :article_categories
  has_many :categories, through: :article_categories
  
  mount_uploader :image, ImageUploader
  is_impressionable
  acts_as_votable

  validates_presence_of :title, :text
  validates_presence_of :image
  
end
