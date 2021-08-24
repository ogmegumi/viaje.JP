class Post < ApplicationRecord
  attachment :image
  belongs_to :user
  # has_one  :plan
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :plan_days, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validates :days,        presence: true
  validates :nights,      presence: true
  validates :budget,      presence: true
  validates :content,     presence: true
  validates :destination, presence: true
  validates :image,       presence: true

  def self.looks(searches, words)
    if searches == "perfect_match"
      @post = Post.where("content LIKE ? OR destination LIKE ? OR budget LIKE ?", "#{words}", "#{words}", "#{words}")
    else
      @post = Post.where("content LIKE ? OR destination LIKE ? OR budget LIKE ?", "#{words}", "#{words}", "#{words}")
    end
  end
end
