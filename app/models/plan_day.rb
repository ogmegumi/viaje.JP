class PlanDay < ApplicationRecord
  belongs_to :post
  has_many :plans, dependent: :destroy
  validates :days, presence: true # 空でないように設定

  accepts_nested_attributes_for :plans, allow_destroy: true
end
