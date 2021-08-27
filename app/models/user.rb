class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :posts,          dependent: :destroy
  has_many :memos,          dependent: :destroy
  has_many :post_connments, dependent: :destroy
  has_many :favorites,      dependent: :destroy
  has_many :tasks,          dependent: :destroy
  # has_many :relationships
  has_many :following_relationships,foreign_key: "follower_id", class_name: "Relationship",  dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships,foreign_key: "following_id",class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  validates :name, length: { minimum: 2 }, presence: true
  validates :introduction, length: { maximum: 50 }

  def following?(other_user)
    self.followings.include?(other_user)
  end

  #ユーザーをフォローする
  def follow(other_user)
    self.following_relationships.create(following_id: other_user.id)
  end

  #ユーザーのフォローを解除する
  def unfollow(other_user)
    self.following_relationships.find_by(following_id: other_user.id).destroy
  end
  
  def self.search_for(content, method)
    if method == 'perfect'
      User.where(name: content)
    elsif method == 'forward'
      User.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      User.where('name LIKE ?', '%' + content)
    else
      User.where('name LIKE ?', '%' + content + '%')
    end
  end
end
