class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :review

  has_many :likes, as: :likable

  acts_as_tree
end
