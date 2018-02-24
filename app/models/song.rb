class Song < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  validates :artist, :title, presence: true
  validates :artist, :title, length: { minimum: 2 }
end