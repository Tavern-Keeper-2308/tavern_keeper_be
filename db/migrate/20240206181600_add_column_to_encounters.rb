class AddColumnToEncounters < ActiveRecord::Migration[7.1]
  def change
    add_column :encounters, :user_name, :string
  end
end
