class TaskCategory < ApplicationRecord
  belongs_to :user
  has_many :tasks
end
