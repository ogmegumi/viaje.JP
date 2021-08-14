class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :task, optional: true
end
