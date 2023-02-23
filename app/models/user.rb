class User < ApplicationRecord
  has_many :articles
  has_many :posts
  has_many :comments
  has_many :likes
  enum role: %i[user admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
