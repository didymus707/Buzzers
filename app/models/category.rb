class Category < ApplicationRecord
  has_many :article_categories, inverse_of: :category
  has_many :articles, through: :article_categories
  
  scope :ordered_by_priority, -> { order(priority: :desc) }

  validates_presence_of :name, :priority
end
