class Comment < ApplicationRecord
  belongs_to :midi
  belongs_to :user
end
