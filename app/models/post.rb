class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :is_a_clickbait

    def is_a_clickbait

        if title.present? && !(title.include?("Wont Believe") || title.include?("Secret") || title.include?("Top [number]")||title.include?("Guess"))
                errors.add(:title, "not a clickbait")
        end
    end
end
