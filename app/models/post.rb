class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum:250}
    validates :summary, length: {maximum:250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :my_validator

    def my_validator
        if title.present?
            if !(title.include?("Won't Believe") || title.include?("Secret") || title.include?("Guess"))
                errors.add(:title,"Clickbait")
            end
        end
        
    end
end

