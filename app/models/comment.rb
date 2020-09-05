class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates_length_of :content, maximum: 150, too_long: 'content too long!'
  validates_presence_of :content
end
