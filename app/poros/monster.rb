class Monster
  attr_reader :index, :name, :challenge_rating, :image, :size, :type, :alignment,
              :armor_class, :speed, :hit_points, :strength, :dexterity, :constitution,
              :intelligence, :wisdom, :charisma, :languages, :special_abilities,
              :actions, :legendary_actions

  def initialize(monster_data)
    @index = monster_data['index']
    @name = monster_data['name']
    @challenge_rating = monster_data['challenge_rating']
    @image = monster_data['image']
    @size = monster_data['size']
    @type = monster_data['type']
    @alignment = monster_data['alignment']
    @armor_class = monster_data['armor_class'].first['value']
    @speed = monster_data['speed']&.transform_keys(&:to_s)
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
  end
end
