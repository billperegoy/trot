class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :start_day, presence: true,
    inclusion: { in: %w( Monday Tuesday Wednesday Thursday Friday Saturday Sunday )}
end
