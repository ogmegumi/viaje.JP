class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts,          dependent: :destroy
  has_many :relationships,  dependent: :destroy
  has_many :memos,          dependent: :destroy
  has_many :post_connments, dependent: :destroy
  has_many :favorites,      dependent: :destroy
  attachment :profile_image
end
