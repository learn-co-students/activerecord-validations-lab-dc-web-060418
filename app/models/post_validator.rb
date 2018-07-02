require 'pry'

class PostValidator < ActiveModel::Validator

  def validate(record)
    x = ["Won't Believe", "Secret", "Top", "Guess"]
    if record.title == nil
      return record.errors[:title] << 'More Clickbaity Please'
    end
    unless record.title.include?(x[0]) || record.title.include?(x[1]) || record.title.include?(x[2]) || record.title.include?(x[3])
      record.errors[:title] << 'More Clickbaity Please'
    end 
  end


end
