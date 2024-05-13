# frozen_string_literal: true

module Profiles
  class SessionsController < Devise::SessionsController
    layout 'auth'
  end
end
