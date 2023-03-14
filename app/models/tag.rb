class Tag < ApplicationRecord
  belongs_to :category
  has_many :post_tags, dependent: :destroy
  has_many :posts, through: :post_tags
  has_many :user_tags, dependent: :destroy
  has_many :users, through: :user_tags
  validates :name, uniqueness: true, presence: true
end
