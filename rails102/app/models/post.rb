class Post < ApplicationRecord
  belongs_to :user
  belongs_to :groups

  validates :content, presence: true
end
