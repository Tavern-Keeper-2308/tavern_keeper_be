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
demo_no_encounters = { user_name: "demo-no-encounters"}

demo_one_encounter = { user_name: "demo-one-encounter"}

demo_many_encounters = { user_name: "demo-many-encounters"}

# encounter for user demo_one_encounter
encounter = FactoryBot.create(:encounter, user_name: demo_one_encounter)
FactoryBot.create(:encounter_monster, encounter: encounter, monster_name: "Goblin")
FactoryBot.create(:encounter_monster, encounter: encounter, monster_name: "Goblin")
FactoryBot.create(:encounter_monster, encounter: encounter, monster_name: "Goblin")
FactoryBot.create(:encounter_monster, encounter: encounter, monster_name: "Goblin")
FactoryBot.create(:encounter_monster, encounter: encounter, monster_name: "Goblin")

# encounters for user demo_many_encounters
encounter1 = FactoryBot.create(:encounter, user_name: demo_many_encounters)
FactoryBot.create(:encounter_monster, encounter: encounter1, monster_name: "Giant Shark")
FactoryBot.create(:encounter_monster, encounter: encounter1, monster_name: "Aboleth")
FactoryBot.create(:encounter_monster, encounter: encounter1, monster_name: "Aboleth")

encounter2 = FactoryBot.create(:encounter, user_name: demo_many_encounters)
FactoryBot.create(:encounter_monster, encounter: encounter2, monster_name: "Goblin")
FactoryBot.create(:encounter_monster, encounter: encounter2, monster_name: "Goblin")

encounter3 = FactoryBot.create(:encounter, user_name: demo_many_encounters)
FactoryBot.create(:encounter_monster, encounter: encounter3, monster_name: "Aboleth")
FactoryBot.create(:encounter_monster, encounter: encounter3, monster_name: "Aboleth")

encounter4 = FactoryBot.create(:encounter, user_name: demo_many_encounters)
FactoryBot.create(:encounter_monster, encounter: encounter4, monster_name: "Goblin")
FactoryBot.create(:encounter_monster, encounter: encounter4, monster_name: "Aboleth")

encounter5 = FactoryBot.create(:encounter, user_name: demo_many_encounters)
FactoryBot.create(:encounter_monster, encounter: encounter5, monster_name: "Kobold")
FactoryBot.create(:encounter_monster, encounter: encounter5, monster_name: "Kobold")
FactoryBot.create(:encounter_monster, encounter: encounter5, monster_name: "Ancient Red Dragon")

encounter6 = FactoryBot.create(:encounter, user_name: demo_many_encounters)
FactoryBot.create(:encounter_monster, encounter: encounter6, monster_name: "Goblin")
FactoryBot.create(:encounter_monster, encounter: encounter6, monster_name: "Goblin")
FactoryBot.create(:encounter_monster, encounter: encounter6, monster_name: "Frog")

encounter7 = FactoryBot.create(:encounter, user_name: demo_many_encounters)
FactoryBot.create(:encounter_monster, encounter: encounter7, monster_name: "Gelatinous Cube")
FactoryBot.create(:encounter_monster, encounter: encounter7, monster_name: "Gelatinous Cube")

encounter8 = FactoryBot.create(:encounter, user_name: demo_many_encounters)
FactoryBot.create(:encounter_monster, encounter: encounter8, monster_name: "Giant Bat")
FactoryBot.create(:encounter_monster, encounter: encounter8, monster_name: "Giant Bat")

encounter9 = FactoryBot.create(:encounter, user_name: demo_many_encounters)
FactoryBot.create(:encounter_monster, encounter: encounter9, monster_name: "Ghast")
FactoryBot.create(:encounter_monster, encounter: encounter9, monster_name: "Ghast")

encounter10 = FactoryBot.create(:encounter, user_name: demo_many_encounters)
FactoryBot.create(:encounter_monster, encounter: encounter10, monster_name: "Ancient Red Dragon")
FactoryBot.create(:encounter_monster, encounter: encounter10, monster_name: "Ancient Red Dragon")
FactoryBot.create(:encounter_monster, encounter: encounter10, monster_name: "Ancient Red Dragon")


