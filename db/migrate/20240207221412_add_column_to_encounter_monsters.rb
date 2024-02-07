class AddColumnToEncounterMonsters < ActiveRecord::Migration[7.1]
  def change
    add_column :encounter_monsters, :monster_index, :string
  end
end

