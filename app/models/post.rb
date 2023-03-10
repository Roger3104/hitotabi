class Post < ApplicationRecord
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  belongs_to :user
  has_one_attached :image

  with_options presence: true, on: :publicize do
    validates :title
    validates :image
    validates :date_to_today
    validates :latitude
    validates :longitude
  end


  def date_to_today
    return if date.blank?
    errors.add(:date, "今日までの日付を指定してください") if date >Date.today
  end

  geocoded_by :address    #Geocoding用
  after_validation :geocode

end
