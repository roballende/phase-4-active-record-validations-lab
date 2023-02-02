class Post < ApplicationRecord

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :contains_the_bait 

    def contains_the_bait
        unless title.include?("Won't Believe") || title.include?("Secret") || title.include?("Top") || title.include?("Guess")
            errors.add(:title, "has to contain the bait")
        end
    end

end
