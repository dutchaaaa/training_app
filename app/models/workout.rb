class Workout < ActiveRecord::Base
  belongs_to :user
  belongs_to :week

  validates :major_exercise, presence: true  
end
