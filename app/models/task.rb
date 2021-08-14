class Task < ApplicationRecord
  has_many :posts, dependent: :destroy
end
