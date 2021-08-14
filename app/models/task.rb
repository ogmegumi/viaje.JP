class Task < ApplicationRecord
  has_many :tasks, dependent: :destroy
end
