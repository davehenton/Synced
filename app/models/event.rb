class Event < ApplicationRecord
  validates :name, :event_type, :start_date, :end_date, presence: true

  enum event_type: { common: 1, gmis: 2 }
  enum status: { preparing: 0, normal: 10, applying: 20, processing: 30, end: 99 }

  has_many :events_guests, dependent: :destroy
  has_many :guests, through: :events_guests, source: :guest
end

# == Schema Information
#
# Table name: events
#
#  id          :uuid             not null, primary key
#  name        :string           not null
#  description :text
#  event_type  :integer          default("1"), not null
#  status      :integer          default("0")
#  start_date  :date
#  end_date    :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_events_on_name    (name)
#  index_events_on_status  (status)
#
