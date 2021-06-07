# frozen_string_literal: true

class User < ApplicationRecord
  include ImageUploader::Attachment(:avatar)
  has_many :categories
  has_many :appointments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true
end
