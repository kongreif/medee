class Comment < ApplicationRecord
  belongs_to :midi
  belongs_to :user
  validates :content, presence: { message: "can't be blank" }
end
