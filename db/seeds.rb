# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

lone_user = { user_name: "IAmLonely"}

encounter1 = FactoryBot.create(:encounter)
FactoryBot.create(:encounter_monster, encounter: encounter1, monster_name: "goblin")
FactoryBot.create(:encounter_monster, encounter: encounter1, monster_name: "goblin")
FactoryBot.create(:encounter_monster, encounter: encounter1, monster_name: "aboleth")

encounter2 = FactoryBot.create(:encounter)
FactoryBot.create(:encounter_monster, encounter: encounter2, monster_name: "goblin")
FactoryBot.create(:encounter_monster, encounter: encounter2, monster_name: "aboleth")
FactoryBot.create(:encounter_monster, encounter: encounter2, monster_name: "aboleth")

encounter3 = FactoryBot.create(:encounter)
FactoryBot.create(:encounter_monster, encounter: encounter3, monster_name: "goblin")
FactoryBot.create(:encounter_monster, encounter: encounter3, monster_name: "aboleth")

encounterG1 = FactoryBot.create(:encounter, user_name: "GoblinKiller")
encounterG2 = FactoryBot.create(:encounter, user_name: "GoblinKiller")
encounterG3 = FactoryBot.create(:encounter, user_name: "GoblinKiller")
encounterG4 = FactoryBot.create(:encounter, user_name: "GoblinKiller")
encounterG5 = FactoryBot.create(:encounter, user_name: "GoblinKiller")

FactoryBot.create(:encounter_monster, encounter: encounterG1, monster_name: "goblin")
FactoryBot.create(:encounter_monster, encounter: encounterG1, monster_name: "goblin")
FactoryBot.create(:encounter_monster, encounter: encounterG1, monster_name: "goblin")
FactoryBot.create(:encounter_monster, encounter: encounterG1, monster_name: "goblin")
FactoryBot.create(:encounter_monster, encounter: encounterG1, monster_name: "goblin")
FactoryBot.create(:encounter_monster, encounter: encounterG2, monster_name: "goblin")
FactoryBot.create(:encounter_monster, encounter: encounterG2, monster_name: "goblin")
FactoryBot.create(:encounter_monster, encounter: encounterG3, monster_name: "goblin")
FactoryBot.create(:encounter_monster, encounter: encounterG3, monster_name: "goblin")
FactoryBot.create(:encounter_monster, encounter: encounterG3, monster_name: "goblin")
FactoryBot.create(:encounter_monster, encounter: encounterG3, monster_name: "goblin")
FactoryBot.create(:encounter_monster, encounter: encounterG3, monster_name: "goblin")
FactoryBot.create(:encounter_monster, encounter: encounterG4, monster_name: "goblin")
FactoryBot.create(:encounter_monster, encounter: encounterG4, monster_name: "goblin")
FactoryBot.create(:encounter_monster, encounter: encounterG5, monster_name: "goblin")
FactoryBot.create(:encounter_monster, encounter: encounterG5, monster_name: "goblin")
FactoryBot.create(:encounter_monster, encounter: encounterG5, monster_name: "goblin")
FactoryBot.create(:encounter_monster, encounter: encounterG5, monster_name: "goblin")
