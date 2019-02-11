class Post < ActiveRecord::Base
  validates :title, length: { minimum: 2 }
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait

  def clickbait
    if title && title.exclude?("Won't Believe" || "Secret" || "Top #{/\d/}" || "Guess")
      errors.add(:title, 'Needs more clickbait')
    end
  end

end
# "Won't Believe", "Secret", "Top [number]", or "Guess"
