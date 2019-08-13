class Memo < ApplicationRecord
  default_scope -> { order(created_at: :desc) }

  belongs_to :user
  has_many :comments
  has_many :stocks
  has_many :likes

  validates :content, length: { in: 1..1200 }
end
