class User < ActiveRecord::Base
  has_many :restaurants, foreign_key: :creator_id
  has_many :reviews, foreign_key: :author_id
  has_many :restaurants_reviewed, through: :reviews, source: :restaurant

  validates :username, :email, uniqueness: true, presence: true
  validates :password, presence: true
  validate :password_length

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @plain_text_pass = new_password
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    if user && user.password == password
      user
    else
      nil
    end
  end

  def password_length
    errors.add(:password, "must be at least 6 characters") if @plain_text_pass.length < 6
  end
end
