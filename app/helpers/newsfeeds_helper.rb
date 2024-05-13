# frozen_string_literal: true

module NewsfeedsHelper
  def most_received_reactions(status)
    status
      .reactions
      .map(&:symbol)
      .tally
      .sort { |a, b| b.last <=> a.last }
      .take(2)
  end
end
