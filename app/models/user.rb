class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  enum role: %i[user admin editor]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  after_initialize :set_default_role
  after_create :welcome_method

  private

  def set_default_role
    self.role ||= :user
  end

  def welcome_method
    byebug
    UserMailer.welcome_email(self).deliver_now
  end
end
