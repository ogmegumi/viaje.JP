class Post < ApplicationRecord
  attachment :image
  belongs_to :user
  belongs_to :task, optional: true
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validates :days,        presence: true
  validates :nights,      presence: true
  validates :budget,      presence: true
  validates :content,     presence: true
  validates :destination, presence: true
  validates :image,       presence: true
end
