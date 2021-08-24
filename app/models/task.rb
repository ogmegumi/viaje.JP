class Task < ApplicationRecord
   validates :belongings, presence: true
end
