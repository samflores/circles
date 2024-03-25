# frozen_string_literal: true

class Circle < ApplicationRecord
  validates :name, presence: true

  belongs_to :owner, class_name: 'Profile', foreign_key: 'profile_id', inverse_of: :owned_circles

  has_many :friendships, dependent: :destroy
  has_many :joined_profiles, through: :friendships, source: :profile
end
