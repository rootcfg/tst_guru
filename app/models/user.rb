class User < ApplicationRecord

  has_many :tests

  def find_by_level(level)
    tests.find_by(level: level) if level.positive?
  end

end
