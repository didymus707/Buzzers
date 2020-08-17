class Category < ApplicationRecord
  has_many :article_categories
  has_many :articles, through: :article_categories
  
  validates_presence_of :name, :priority
end
