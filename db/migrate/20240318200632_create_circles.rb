class CreateCircles < ActiveRecord::Migration[7.1]
  def change
    create_table :circles do |t|
      t.string :name, null: false
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
