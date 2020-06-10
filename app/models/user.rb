class User < ApplicationRecord
  before_save { self.email = email.downcase}
  # change the state of an object before saving to DB 
  # in the above line self is referencing any object for the user class, therefore when it comes to emails - before saving it DB apply downcase and then save
  has_many :articles
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 105 }, format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end