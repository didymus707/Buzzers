class Article < ApplicationRecord
  default_scope { order(created_at: :desc) }
  belongs_to :author, class_name: 'User'
  has_many :article_categories, inverse_of: :article, dependent: :destroy
  has_many :categories, through: :article_categories
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :categories, allow_destroy: true, reject_if: :all_blank

  mount_uploader :image, ImageUploader
  is_impressionable
  acts_as_votable

  validates_presence_of :title, :text
  validates_length_of :text, maximum: 200, too_long: "text should not be more than 200 characters!"
  validates_presence_of :image
end
