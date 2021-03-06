class Guest < ApplicationRecord
  validates :name, presence: true

  has_many :events_guests, dependent: :destroy
  has_many :events, through: :events_guests, source: :event
end

# == Schema Information
#
# Table name: guests
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  company    :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
