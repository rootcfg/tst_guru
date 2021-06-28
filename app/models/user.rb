class User < ApplicationRecord

  has_many :tests_user
  has_many :tests, through: :tests_user

  def find_by_level(level)
    tests.where(level: level)
  end

end
