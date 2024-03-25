class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.string :full_name, null: false
      t.string :bio

      t.timestamps
    end
  end
end
