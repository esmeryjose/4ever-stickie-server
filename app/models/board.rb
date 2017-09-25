class Board < ApplicationRecord
  has_many :notes, dependent: :destroy
  validates :title, presence: true
  scope :most_recent, -> { order(created_at: :asc)}
  scope :my_boards, -> id {where(user_id: id)}
end
