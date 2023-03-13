class Post < ApplicationRecord
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_one_attached :image

  validates :title, presence: true
  validates :date, presence: true
  validates :image, presence: true
  validate :date_to_today

  def date_to_today
    return if date.blank?
    errors.add(:date, "今日までの日付を指定してください") if date >Date.today
  end

  def favorited?(user) #行ってみたいボタン用
   favorites.where(user_id: user.id).exists?
  end

  geocoded_by :address    #Geocoding用
  after_validation :geocode

  enum status: { published: 0, draft: 1 }

end
