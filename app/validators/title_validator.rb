class TitleValidator < ActiveModel::Validator
  def validate(record)
    unless record.title.include? "Won't Believe" || "Secret" || "Top [number]" || "Guess"
      record.errors[:title] << "less clickbait-y"
    end
    
  end
end