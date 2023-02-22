class Article < ApplicationRecord
  belongs_to :user
  has_many :posts
  validates :title, :description, presence: true
end
