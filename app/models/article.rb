class Article < ApplicationRecord
  validates_presence_of :title, :text
  belongs_to :author, class_name: 'User'
end
