class Monster
  attr_accessor :size, :type, :alignment, :armor_class, :speed, :hit_points,
                :strength, :dexterity, :constitution, :intelligence, :wisdom,
                :charisma, :languages, :special_abilities, :actions, :legendary_actions

  # def initialize(details)
  #   @size = details[:size]
  #   @type = details[:type]
  #   @alignment = details[:alignment]
  #   @armor_class = details[:armor_class]
  #   @speed = details[:speed]
  #   @hit_points = details[:hit_points]
  #   @strength = details[:strength]
  #   @dexterity = details[:dexterity]
  #   @constitution = details[:constitution]
  #   @intelligence = details[:intelligence]
  #   @wisdom = details[:wisdom]
  #   @charisma = details[:charisma]
  #   @languages = details[:languages]
  #   @special_abilities = details[:special_abilities]
  #   @actions = details[:actions]
  #   @legendary_actions = details[:legendary_actions]
  # end

  def initialize(monster_data)
    @index = monster_data.index
    @name = monster_data.name
    @image = monster_data.image
    @size = monster_data.size
    @type = monster_data.type
    @alignment = monster_data.alignment
    @armor_class = monster_data.armor_class.first.value
    #Let me know if you want keys to be symbols, might be useful as strings though
    @speed = monster_data.speed.to_h
    @hit_points = monster_data.hit_points
    @strength = monster_data.strength
    @dexterity = monster_data.dexterity
    @constitution = monster_data.constitution
    @intelligence = monster_data.intelligence
    @wisdom = monster_data.wisdom
    @charisma = monster_data.charisma
    @languages = monster_data.languages
    #IS AN ARRAY OF STRINGS WHAT WE WANT FOR THESE??
    @special_abilities = make_desc_array(monster_data.special_abilities)
    @actions = make_desc_array(monster_data.actions)
    @legendary_actions = make_desc_array(monster_data.legendary_actions)
  end

  private

  def make_desc_array(objects)
    objects.map do |object|
      object.desc
    end
  end
end