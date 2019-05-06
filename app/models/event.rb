class Event < ApplicationRecord
  has_many :attendances
  belongs_to :user

  validates :start_date, presence: true, if: :is_datetime_passed?
  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }, if: :modulo_five?
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 1000 }
  validates :location, presence: true

  def modulo_five?
    duration % 5 == 0
  end

  def is_datetime_passed?
    start_date < Date.today
  end
end
