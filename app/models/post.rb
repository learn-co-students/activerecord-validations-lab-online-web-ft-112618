class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbaity

  def clickbaity
    errors.add(:title, "must be clickbaity") unless title && title.match(/Won't Believe|Secret|Top [0-9]*|Guess/i)
  end
end
