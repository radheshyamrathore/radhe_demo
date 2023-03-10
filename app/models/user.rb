class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  enum role: %i[user admin editor]

  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  after_initialize :set_default_role
  #after_create :welcome_method


  def set_default_role
    self.role ||= :user
  end

  def welcome_method
    byebug
    ConfirmationEmailJob.set(wait: 1.minute).perform_later(self)
  end
end
