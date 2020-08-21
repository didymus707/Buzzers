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

  # scope :ordered_by_most_recent, -> { order(created_at: :desc) }

  validates_presence_of :title, :text
  validates_presence_of :image
end
