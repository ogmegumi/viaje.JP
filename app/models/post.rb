class Post < ApplicationRecord
  attachment :image
  belongs_to :user
  # has_one  :plan
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :plan_days, dependent: :destroy
  has_many :tags_relationships, dependent: :destroy
  has_many :tags, through: :tags_relationships

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validates :days,        presence: true
  validates :nights,      presence: true
  validates :budget,      presence: true
  validates :content,     presence: true
  validates :destination, presence: true
  validates :image,       presence: true

  def self.search_for(content, method)
    if method == 'perfect'
      Post.where(content: content, destination: content, budget: content)
    elsif method == 'forward'
      Post.where("content LIKE ? OR destination LIKE ? OR budget LIKE ?", content+'%', content+'%', content+'%')
    elsif method == 'backward'
      Post.where("content LIKE ? OR destination LIKE ? OR budget LIKE ?", '%'+content, '%'+content, '%'+content)
    else
      Post.where("content LIKE ? OR destination LIKE ? OR budget LIKE ?", '%'+content+'%', '%'+content+'%', '%'+content+'%')
    end
  end

  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end

    new_tags.each do |new|
      new_tag = Tag.find_or_create_by(name: new)
      self.tags << new_tag
    end
  end

end
