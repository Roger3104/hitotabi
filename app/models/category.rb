class Category < ApplicationRecord
  has_many :tags, dependent: :destroy
  validates :name, uniqueness: true, presence: true
end
