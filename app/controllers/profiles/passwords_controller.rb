# frozen_string_literal: true

module Profiles
  class PasswordsController < Devise::PasswordsController
    layout 'auth'
  end
end
