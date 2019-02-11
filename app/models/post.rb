class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 10}
  validates :summary, length: {maximum: 100}
  validates :category, inclusion: { in: %w(Fiction Non-fiction)}
  validate :clickbait
end

def clickbait
  if !title.nil? && (!title.include?("You Won't" || "Secret" || "Top" || "Guess"))
    errors.add(:clickbait, "That is not a clickbait worthy title. Try again.")
  end
end
