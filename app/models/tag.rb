class Tag < ApplicationRecord
  has_many :tags_relationships, dependent: :destroy
  has_many :posts, through: :tags_relationships

  validates :name, uniqueness: true, presence: true
end
