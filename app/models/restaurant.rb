class Restaurant < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :reviews
  has_many :authors, through: :reviews

  validates :name, :cuisine, :creator_id, presence: true
  validates :address, :city, :state, :zip, presence: true

  def full_address
    "#{self.address}, #{self.city}, #{self.state} #{self.zip}"
  end

  def city_state
    "#{self.city}, #{self.state}"
  end

  def avg_rating
    (total_review_score.to_f / num_of_reviews).round(1)
  end

  private

  def total_review_score
    self.reviews.pluck(:rating).inject(:+)
  end

  def num_of_reviews
    self.reviews.count
  end
end
