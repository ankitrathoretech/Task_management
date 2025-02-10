class Project < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy

  validates :title, :details, presence: true
  enum :status, { draft: 0, in_progress: 1, in_review: 2, approved: 3 }, prefix: :status
end
