class User < ApplicationRecord
  has_many :articles, foreign_key: :author_id, dependent: :destroy
  
  validates_presence_of :name
  validates :username, uniqueness: true
  validates_length_of :name, minimum: 3, too_short: 'please enter at least 3 characters!'

end
