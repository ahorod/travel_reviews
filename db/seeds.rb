class Seed

  def self.begin
    seed = Seed.new
    seed.generate_quotes
  end

  def generate_quotes
    20.times do |i|
      review = Review.create!(
        author: Faker::Book.author,
        content: Faker::ChuckNorris.fact,
        city: Faker::Address.city,
        rating: Faker::Number.between(1, 5)
      )
      puts "Review #{i}: Author is #{review.author} and rating is '#{review.rating}'."
    end
  end
end

Seed.begin
