class Topic < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :content, presence: true
  validates :title, presence: true
end
