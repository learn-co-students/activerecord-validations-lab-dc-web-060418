class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :is_title_clickbaity

  def is_title_clickbaity
    if title.present?
      if !(title.include?("Won't Believe") || title.include?("Secret") || title.include?("Top") || title.include?("Guess"))
          errors.add(:title, "Title must be clickbaity")
      end
    end
  end


end
