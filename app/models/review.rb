class Review < ApplicationRecord
  validates :author, presence: true
  validates :content, presence: true
  validates :city, presence: true
  scope :search, -> (keyword){ where("city like ?", "%#{keyword}%") }

# scope to show cities which are most reviewed
  scope :most_reviews, -> (number){(
    select("reviews.city, count(reviews.city) as city_count")
    .group("reviews.city")
    .order("city_count DESC")
    .limit("#{number}")
    )}

  scope :random_city, -> (number){(
    select("reviews.city")
    .order("random()")
    .limit("#{number}")
    )}
end
