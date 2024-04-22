# frozen_string_literal: true

class Status < ApplicationRecord
  belongs_to :profile
  belongs_to :parent, class_name: 'Status', optional: true

  has_many :children, class_name: 'Status', inverse_of: :parent, dependent: :destroy
  has_many :reactions, dependent: :destroy

  validates :body, presence: true

  scope :top_level, -> { where(parent: nil) }
  scope :latest_first, -> { order(created_at: :desc) }
end
