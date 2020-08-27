class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates_length_of :content, maximum: 50, too_long: 'content too long!'
end
