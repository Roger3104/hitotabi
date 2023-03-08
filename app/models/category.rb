class Category < ApplicationRecord
  has_many :tags, dependent: :destroy

  validates :name, presence: true
end
