class Category < ApplicationRecord
    has_many :categorizations
    has_many :posts, through: :categorizations
    belongs_to :category
  end