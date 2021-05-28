class Appointment < ApplicationRecord
  belongs_to :category
  belongs_to :user
  belongs_to  :parent, class_name: 'Appointment', optional: true
  has_many    :replies, class_name: 'Appointment', foreign_key: :parent_id, dependent: :destroy

  validates :body, presence: true
end
