class RenameValueOnReactions < ActiveRecord::Migration[7.1]
  def change
    rename_column :reactions, :value, :symbol
  end
end
