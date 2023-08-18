class Post < ApplicationRecord
  has_many :likes
  belongs_to :user
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_one_attached :image

end