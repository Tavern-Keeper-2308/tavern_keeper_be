class Monster
  attr_accessor :size, :type, :alignment, :armor_class, :speed, :hit_points,
                :strength, :dexterity, :constitution, :intelligence, :wisdom,
                :charisma, :languages, :special_abilities, :actions, :legendary_actions

  def initialize(details)
    @size = details[:size]
    @type = details[:type]
    @alignment = details[:alignment]
    @armor_class = details[:armor_class]
    @speed = details[:speed]
    @hit_points = details[:hit_points]
    @strength = details[:strength]
    @dexterity = details[:dexterity]
    @constitution = details[:constitution]
    @intelligence = details[:intelligence]
    @wisdom = details[:wisdom]
    @charisma = details[:charisma]
    @languages = details[:languages]
    @special_abilities = details[:special_abilities]
    @actions = details[:actions]
    @legendary_actions = details[:legendary_actions]
  end
end