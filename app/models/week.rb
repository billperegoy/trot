class Week < ActiveRecord::Base
  validates :number, presence: true, numericality: {only_integer: true}, uniqueness: {scope: :training_plan}

  belongs_to :training_plan
  has_many :days
  after_save :create_empty_days

  def create_empty_days
    (0..6).each do |number|
      Day.create(number: number, week_id: self.id)
    end
  end
end
