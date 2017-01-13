class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :review

  has_many :likes, as: :likable

  acts_as_tree dependent: :delete_all, order: "created_at DESC"

  validates :content, presence: true

  scope :order_desc, ->{order created_at: :desc}
end
