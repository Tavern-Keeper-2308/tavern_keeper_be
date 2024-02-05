class MonsterFacade
  def self.monster_list
    service = DndService.new
    response = service.query_monster_list
    monsters_data = response.original_hash['data']['monsters']
    monsters_data.map do |monster|
      Monster.new(monster)
    end
  end

  def self.single_monster_details(index)
    service = DndService.new
    response = service.query_monster_details(index)
    monster_data = response.original_hash['data']['monster']
    [Monster.new(monster_data)]
  end
end