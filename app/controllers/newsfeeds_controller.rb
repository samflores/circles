# frozen_string_literal: true

# Newsfeed

class NewsfeedsController < ApplicationController
  before_action :authenticate_profile!

  def index
    @statuses = Status
                .includes(%i[profile reactions], children: %i[profile reactions children])
                .top_level
                .latest_first
  end
end
