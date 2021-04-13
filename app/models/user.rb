class User < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :topics, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
