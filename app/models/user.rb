class User < ActiveRecord::Base
  has_many :workouts

  has_secure_password
  validates :name, :email, :password, :bench, :squat, :deadlift, :overhead_press, presence: true
end
