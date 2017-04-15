class Group < ApplicationRecord
belongs_to :User
  validates :title,presence: true

end
