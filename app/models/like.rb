class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates_inclusion_of :is_like, in: [true, false]
end