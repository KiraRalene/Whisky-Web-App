class User < ApplicationRecord
  has_secure_password
  before_validation :downcase_email

  has_many :whiskies
  has_many :notes

  has_many :likes, dependent: :destroy
  has_many :liked_notes, through: :likes, source: :note

  has_many :wishes, dependent: :destroy
  has_many :wished_whiskies, through: :wishes, source: :whiskies

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true,
            format: VALID_EMAIL_REGEX

  def full_name
    "#{first_name} #{last_name}".strip.titleize
  end

  private

  def downcase_email
    self.email&.downcase!
  end
end
