class User < ApplicationRecord
  has_many :articles, foreign_key: :author_id, dependent: :destroy
  has_many :comments, dependent: :destroy

  acts_as_voter

  validates_presence_of :name, :username
  validates :username, uniqueness: true
  validates_length_of :name, minimum: 3, too_short: 'please enter at least 3 characters!'
end
