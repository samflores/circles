# frozen_string_literal: true

class Profile < ApplicationRecord
  validates :full_name, presence: true
  validates :bio, presence: { allow_nil: true }
  validates :tos_agreement, acceptance: true
  validates :born_on, presence: true, comparison: { less_than: 13.years.ago }

  has_many :statuses, dependent: :destroy

  has_many :owned_circles, class_name: 'Circle', inverse_of: :owner, dependent: :destroy
  has_many :following, through: :owned_circles, source: :joined_profiles

  has_many :friendships, dependent: :destroy
  has_many :joined_circles, through: :friendships, source: :circle
  has_many :followers, through: :joined_circles, source: :owner

  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
end
