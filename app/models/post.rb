class Post < ActiveRecord::Base
  include ActiveModel
validates_with CustomValidator
  validates :title, presence: true
  validates :content, length: {minimum:250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}


end
