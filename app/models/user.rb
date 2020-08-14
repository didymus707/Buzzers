class User < ApplicationRecord
  validates_presence_of :name
  validates_length_of :name, minimum: 3, too_short: 'please enter at least 3 characters!'

  has_many :articles, foreign_key: :author_id, dependent: :destroy
end
