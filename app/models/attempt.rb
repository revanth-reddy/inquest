class Attempt < ActiveRecord::Base

	belongs_to :user
	belongs_to :level
	default_scope -> { order(created_at: :desc) }
	validates :attempt, presence: true, length: { maximum: 500 }
end
