class Reaction < ApplicationRecord
  belongs_to :profile
  belongs_to :status

  enum :symbol, {
    like: 0,
    dislike: 1,
    heart: 2,
    vomit: 3
  }

  scope :count_by_symbol, lambda {
    group(:symbol)
      .order(count_all: :desc)
      .count
  }
end
