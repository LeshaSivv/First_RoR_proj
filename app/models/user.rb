class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname

  validates :email, presence: true, uniqueness: true
  validates :nickname, presence: true, length: {in: 3..12}
  validates :name, presence: true, length: {in: 3..12}

  def downcase_nickname
    nickname.downcase!
  end
end
