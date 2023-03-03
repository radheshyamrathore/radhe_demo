class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  enum role: %i[user admin editor]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
