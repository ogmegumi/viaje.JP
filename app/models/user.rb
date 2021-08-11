class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :post,          dependent: :destroy
  has_many :relationship,  dependent: :destroy
  has_many :memo,          dependent: :destroy
  has_many :task,          dependent: :destroy
  has_many :post_connment, dependent: :destroy
end
