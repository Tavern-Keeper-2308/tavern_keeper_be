# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# users
EncounterMonster.joins(:encounter).where(encounters: { user_id: 2 }).destroy_all
Encounter.where(user_id: 2).destroy_all
EncounterMonster.joins(:encounter).where(encounters: { user_id: 3 }).destroy_all
Encounter.where(user_id: 3).destroy_all

demo_no_encounters = { user_id: 1}

demo_one_encounter = { user_id: 2}

demo_many_encounters = { user_id: 3}

# encounter for user demo_one_encounter
encounter = FactoryBot.create(:encounter, demo_one_encounter)
FactoryBot.create(:encounter_monster, encounter: encounter, monster_name: "Goblin", monster_index: "goblin")
FactoryBot.create(:encounter_monster, encounter: encounter, monster_name: "Goblin", monster_index: "goblin")
FactoryBot.create(:encounter_monster, encounter: encounter, monster_name: "Goblin", monster_index: "goblin")
FactoryBot.create(:encounter_monster, encounter: encounter, monster_name: "Goblin", monster_index: "goblin")
FactoryBot.create(:encounter_monster, encounter: encounter, monster_name: "Goblin", monster_index: "goblin")

# encounters for user demo_many_encounters
encounter1 = FactoryBot.create(:encounter, demo_many_encounters)
FactoryBot.create(:encounter_monster, encounter: encounter1, monster_name: "Giant Shark", monster_index: "giant-shark")
FactoryBot.create(:encounter_monster, encounter: encounter1, monster_name: "Aboleth", monster_index: "aboleth")
FactoryBot.create(:encounter_monster, encounter: encounter1, monster_name: "Aboleth", monster_index: "aboleth")

encounter2 = FactoryBot.create(:encounter, demo_many_encounters)
FactoryBot.create(:encounter_monster, encounter: encounter2, monster_name: "Goblin", monster_index: "goblin")
FactoryBot.create(:encounter_monster, encounter: encounter2, monster_name: "Goblin", monster_index: "goblin")

encounter3 = FactoryBot.create(:encounter, demo_many_encounters)
FactoryBot.create(:encounter_monster, encounter: encounter3, monster_name: "Aboleth", monster_index: "aboleth")
FactoryBot.create(:encounter_monster, encounter: encounter3, monster_name: "Aboleth", monster_index: "aboleth")

encounter4 = FactoryBot.create(:encounter, demo_many_encounters)
FactoryBot.create(:encounter_monster, encounter: encounter4, monster_name: "Goblin", monster_index: "goblin")
FactoryBot.create(:encounter_monster, encounter: encounter4, monster_name: "Aboleth", monster_index: "aboleth")

encounter5 = FactoryBot.create(:encounter, demo_many_encounters)
FactoryBot.create(:encounter_monster, encounter: encounter5, monster_name: "Kobold", monster_index: "kobold")
FactoryBot.create(:encounter_monster, encounter: encounter5, monster_name: "Kobold", monster_index: "kobold")
FactoryBot.create(:encounter_monster, encounter: encounter5, monster_name: "Ancient Red Dragon", monster_index: "ancient-red-dragon")

encounter6 = FactoryBot.create(:encounter, demo_many_encounters)
FactoryBot.create(:encounter_monster, encounter: encounter6, monster_name: "Goblin", monster_index: "goblin")
FactoryBot.create(:encounter_monster, encounter: encounter6, monster_name: "Goblin", monster_index: "goblin")
FactoryBot.create(:encounter_monster, encounter: encounter6, monster_name: "Frog", monster_index: "frog")

encounter7 = FactoryBot.create(:encounter, demo_many_encounters)
FactoryBot.create(:encounter_monster, encounter: encounter7, monster_name: "Gelatinous Cube", monster_index: "gelatinous-cube")
FactoryBot.create(:encounter_monster, encounter: encounter7, monster_name: "Gelatinous Cube", monster_index: "gelatinous-cube")

encounter8 = FactoryBot.create(:encounter, demo_many_encounters)
FactoryBot.create(:encounter_monster, encounter: encounter8, monster_name: "Giant Bat", monster_index: "giant-bat")
FactoryBot.create(:encounter_monster, encounter: encounter8, monster_name: "Giant Bat", monster_index: "giant-bat")

encounter9 = FactoryBot.create(:encounter, demo_many_encounters)
FactoryBot.create(:encounter_monster, encounter: encounter9, monster_name: "Ghast", monster_index: "ghast")
FactoryBot.create(:encounter_monster, encounter: encounter9, monster_name: "Ghast", monster_index: "ghast")

encounter10 = FactoryBot.create(:encounter, demo_many_encounters)
FactoryBot.create(:encounter_monster, encounter: encounter10, monster_name: "Ancient Red Dragon", monster_index: "ancient-red-dragon")
FactoryBot.create(:encounter_monster, encounter: encounter10, monster_name: "Ancient Red Dragon", monster_index: "ancient-red-dragon")
FactoryBot.create(:encounter_monster, encounter: encounter10, monster_name: "Ancient Red Dragon", monster_index: "ancient-red-dragon")



