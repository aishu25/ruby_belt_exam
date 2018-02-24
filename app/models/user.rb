class User < ActiveRecord::Base
  has_secure_password
  has_many :songs
  has_many :likes
  has_many :liked_songs, through: :likes, source: :song

  before_save :downcase
  email_regex = /\A[A-Za-z0-9]+@[A-Za-z]+\.[A-Za-z]{3}/
  
  validates :first_name, :last_name, presence: true
  validates :email, 
    uniqueness: { case_sensitive: false }, 
    presence: true,
    format: { with: email_regex }
  

  def downcase
    self.email.downcase!
    self.first_name.downcase!
    self.last_name.downcase!
  end
end
