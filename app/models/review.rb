class Review < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :author, class_name: "User"

  validates :description, :rating, :author_id, :restaurant_id, presence: true
  validates :rating, numericality: { greater_than: 0 }
  validates :rating, numericality: { less_than_or_equal_to: 5 }

  def thanks
    "Thank you for your review."
  end
end
