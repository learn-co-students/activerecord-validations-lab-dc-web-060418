class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
    validate :title_must_be_clickbaity

    def title_must_be_clickbaity
        # example:
        # if expiration_date.present? && expiration_date < Date.today
        #     errors.add(:expiration_date, "can't be in the past")
        # end
        # example on how to check inclusion [needle1, needle2].any? { |needle| haystack.include? needle }
        if title.present? && !["Won't Believe", "Secret", "Top [number]", "Guess"].any? { |word| title.include?(word) }
            errors.add(:title, "has to be clickbaity")
        end
    end

end
