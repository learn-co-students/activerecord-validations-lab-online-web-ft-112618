class Post < ActiveRecord::Base

    validates_presence_of :title
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbait

    def clickbait
     if title && (!title.include?("You Won't Believe")) 
       errors.add(:clickbait, "That is not a clickbait worthy title. Try again.")
     end
   end

end
