class CreateReactions < ActiveRecord::Migration[7.1]
  def change
    create_table :reactions do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :status, null: false, foreign_key: true
      t.integer :value, null: false, default: 0

      t.timestamps
    end
  end
end
