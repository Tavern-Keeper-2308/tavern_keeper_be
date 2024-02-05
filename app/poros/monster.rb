class Monster
  attr_reader :index, :name, :challenge_rating, :image, :size, :type, :alignment,
              :armor_class, :speed, :hit_points, :strength, :dexterity, :constitution,
              :intelligence, :wisdom, :charisma, :languages, :special_abilities,
              :actions, :legendary_actions, :proficiencies, :senses, :damage_immunities,
              :damage_resistances, :damage_vulnerabilities, :condition_immunities, :proficiency_bonus

  def initialize(monster_data)
    @index = monster_data['index']
    @name = monster_data['name']
    @challenge_rating = monster_data['challenge_rating'].to_s
    @image = monster_data['image']
    @size = monster_data['size']
    @type = monster_data['type']
    @alignment = monster_data['alignment']
    @armor_class = monster_data['armor_class']&.first&.fetch('value', nil).to_s
    @speed = monster_data['speed']
    @hit_points = monster_data['hit_points']
    @strength = monster_data['strength']
    @dexterity = monster_data['dexterity']
    @constitution = monster_data['constitution']
    @intelligence = monster_data['intelligence']
    @wisdom = monster_data['wisdom']
    @charisma = monster_data['charisma']
    @languages = monster_data['languages']
    @special_abilities = monster_data['special_abilities']
    @actions = monster_data['actions']
    @legendary_actions = monster_data['legendary_actions']
    @proficiencies = monster_proficiencies(monster_data['proficiencies'])
    @senses = monster_data['senses']
    @damage_immunities = monster_data['damage_immunities']
    @damage_immunities = monster_data['condition_immunities']
    @damage_immunities = monster_data['damage_resistances']
    @damage_immunities = monster_data['damage_vulnerabilities']
    @proficiency_bonus = monster_data['proficiency_bonus']
  end
  
  private
  
  def monster_proficiencies(raw_proficiency_data)
    if !raw_proficiency_data.nil?
      raw_proficiency_data.map do |proficiency|
        { 'value' => proficiency['value'], 'name' => proficiency['proficiency']['name']}
      end 
    end
  end
end
