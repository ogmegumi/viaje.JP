class Plan < ApplicationRecord
  validates :plan_content, :start_time, :finish_time, presence: true
 belongs_to :post
end
