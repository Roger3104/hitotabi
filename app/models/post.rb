class Post < ApplicationRecord
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true
  validates :date, presence: true
  validates :image, presence: true

  geocoded_by :address    #Geocoding用
  after_validation :geocode
  
end
