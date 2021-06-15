require 'pry'
class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
#  validates_with TitleValidator
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :is_clickbait?

  def is_clickbait?
#    click_bait = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    click_bait = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
    if click_bait.none? {|pat| pat.match title}
      errors.add(:title, "must be clickbait")
    end
  end

end
