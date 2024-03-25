class Status < ApplicationRecord
  belongs_to :profile
  belongs_to :parent, class_name: 'Status', optional: true

  validates :body, presence: true
end
