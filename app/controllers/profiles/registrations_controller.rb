# frozen_string_literal: true

module Profiles
  class RegistrationsController < Devise::RegistrationsController
    layout 'auth'

    before_action :configure_sign_up_params, only: [:create]

    protected

    def configure_sign_up_params
      devise_parameter_sanitizer
        .permit(
          :sign_up,
          keys: %i[bon_on full_name tos_agreement]
        )
    end
  end
end
