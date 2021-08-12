class Post < ApplicationRecord
  attachment :image
  belongs_to :user
  has_many :task, dependent: :destroy
  
  validates :days, presence: true
  validates :nights, presence: true
end
