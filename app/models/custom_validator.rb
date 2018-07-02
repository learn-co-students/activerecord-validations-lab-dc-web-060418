class CustomValidator<ActiveModel::Validator

  def validate(post)
    if post.title
      click_able = ["Won't Believe", "Secret", "Top[number]", "Guess"]
      if !click_able.any? {|s| post.title.include?(s)}
        post.errors[:title]<< false

      end
    end
  end

end
