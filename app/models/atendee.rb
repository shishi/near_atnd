class Atendee < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  validates :status, presence: true

  enum status: { attended: 0, absented: 1 }
end
