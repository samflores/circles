# frozen_string_literal: true

class AddTosAgreementToProfiles < ActiveRecord::Migration[7.1]
  def change
    add_column :profiles, :tos_agreement, :boolean, null: false, default: false
  end
end
