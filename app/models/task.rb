class Task < ActiveRecord::Base
  belongs_to :project 
  validates :title,:due_date,
      presence: true

  scope :finished, -> { where(done: true) }
end
