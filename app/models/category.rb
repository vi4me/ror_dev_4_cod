class Category < ApplicationRecord
  has_many :appointments
  belongs_to :user

  validates :title, presence: true
end
