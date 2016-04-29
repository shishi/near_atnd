class Event < ActiveRecord::Base
  belongs_to :user
  has_many :atendees

  validates :title, presence: true, length: { maximum: 255 }
  validates :hold_at, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true }
  validates :location, presence: true, length: { maximum: 255 }
  validates :owner, presence: true, length: { maximum: 255 }
  validates :description, presence: true
end
