class CreateStatuses < ActiveRecord::Migration[7.1]
  def change
    create_table :statuses do |t|
      t.text :body, null: false
      t.references :profile, null: false, foreign_key: true
      t.references :parent, foreign_key: { to_table: :statuses }

      t.timestamps
    end
  end
end
