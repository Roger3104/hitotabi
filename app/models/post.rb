class Post < ApplicationRecord
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :image
  
  

  with_options presence: true, if: :post_published? do |v|
    v.validates :date
    v.validates :image
  end

  def post_published?
    status == "published"
  end

  validate :date_to_today
  validates :title, presence: true

  def date_to_today #日付指定用
    return if date.blank?
    errors.add(:date, "今日までの日付を指定してください") if date >Date.today
  end

  def favorited?(user) #行ってみたいボタン用
   favorites.where(user_id: user.id).exists?
  end

  geocoded_by :address    #Geocoding用
  after_validation :geocode

  enum status: { published: 0, draft: 1 } #下書き機能用

  def self.looks(word)
    @posts = Post.where("title LIKE?","%#{word}%")
  end

end
