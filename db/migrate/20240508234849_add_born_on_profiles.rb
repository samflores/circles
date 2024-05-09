class AddBornOnProfiles < ActiveRecord::Migration[7.1]
  def change
    add_column :profiles, :born_on, :date, null: false, default: null
  end
end
