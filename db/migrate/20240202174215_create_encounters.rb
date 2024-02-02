class CreateEncounters < ActiveRecord::Migration[7.1]
  def change
    create_table :encounters do |t|
      t.string :encounter_name
      t.integer :party_size
      t.integer :party_level
      t.string :summary
      t.string :description
      t.string :treasure

      t.timestamps
    end
  end
end
