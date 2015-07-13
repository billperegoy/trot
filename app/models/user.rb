class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  has_many :preferences
  after_save :create_default_preferences

  def create_default_preferences
    Preference.create(name: 'start_day', value: 'monday', user_id: self.id)
  end
end
