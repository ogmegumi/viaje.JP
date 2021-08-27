class Memo < ApplicationRecord
  validates :memo, presence: true
  belongs_to :user
end
