require 'rails_helper'

RSpec.describe Monster do
  before(:each) do
    details = {
      "index" => "aboleth",
      "name" => "Aboleth",
      "size" => "Large",
      "type" => "aberration",
      "alignment" => "lawful evil",
      "armor_class" => [
        {
          "type" => "natural",
          "value" => '17'
        }
      ],
      "hit_points" => 135,
      "hit_dice" => "18d10",
      "hit_points_roll" => "18d10+36",
      "speed" => {
        "walk" => "10 ft.",
        "swim" => "40 ft."
      },
      "strength" => 21,
      "dexterity" => 9,
      "constitution" => 15,
      "intelligence" => 18,
      "wisdom" => 15,
      "charisma" => 18,
      "proficiencies" => [
        {
          "value" => 6,
          "proficiency" => {
            "index" => "saving-throw-con",
            "name" => "Saving Throw: CON",
            "url" => "/api/proficiencies/saving-throw-con"
          }
        },
        {
          "value" => 8,
          "proficiency" => {
            "index" => "saving-throw-int",
            "name" => "Saving Throw: INT",
            "url" => "/api/proficiencies/saving-throw-int"
          }
        },
        {
          "value" => 6,
          "proficiency" => {
            "index" => "saving-throw-wis",
            "name" => "Saving Throw: WIS",
            "url" => "/api/proficiencies/saving-throw-wis"
          }
        },
        {
          "value" => 12,
          "proficiency" => {
            "index" => "skill-history",
            "name" => "Skill: History",
            "url" => "/api/proficiencies/skill-history"
          }
        },
        {
          "value" => 10,
          "proficiency" => {
            "index" => "skill-perception",
            "name" => "Skill: Perception",
            "url" => "/api/proficiencies/skill-perception"
          }
        }
      ],
      "damage_vulnerabilities" => [],
      "damage_resistances" => [],
      "damage_immunities" => [],
      "condition_immunities" => [],
      "senses" => {
        "darkvision" => "120 ft.",
        "passive_perception" => 20
      },
      "languages" => "Deep Speech, telepathy 120 ft.",
      "challenge_rating" => 10,
      "proficiency_bonus" => 4,
      "xp" => 5900,
      "special_abilities" => [
        {
          "name" => "Amphibious",
          "desc" => "The aboleth can breathe air and water."
        },
        {
          "name" => "Mucous Cloud",
          "desc" => "While underwater, the aboleth is surrounded by transformative mucus. A creature that touches the aboleth or that hits it with a melee attack while within 5 ft. of it must make a DC 14 Constitution saving throw. On a failure, the creature is diseased for 1d4 hours. The diseased creature can breathe only underwater."
        },
        {
          "name" => "Probing Telepathy",
          "desc" => "If a creature communicates telepathically with the aboleth, the aboleth learns the creature's greatest desires if the aboleth can see the creature."
        }
      ],
      "actions" => [
        {
          "name" => "Multiattack",
          "desc" => "The aboleth makes three tentacle attacks."
        },
        {
          "name" => "Tentacle",
          "desc" => "Melee Weapon Attack: +9 to hit, reach 10 ft., one target. Hit: 12 (2d6 + 5) bludgeoning damage. If the target is a creature, it must succeed on a DC 14 Constitution saving throw or become diseased. The disease has no effect for 1 minute and can be removed by any magic that cures disease. After 1 minute, the diseased creature's skin becomes translucent and slimy, the creature can't regain hit points unless it is underwater, and the disease can be removed only by heal or another disease-curing spell of 6th level or higher. When the creature is outside a body of water, it takes 6 (1d12) acid damage every 10 minutes unless moisture is applied to the skin before 10 minutes have passed."
        },
        {
          "name" => "Tail",
          "desc" => "Melee Weapon Attack: +9 to hit, reach 10 ft., one target. Hit: 15 (3d6 + 5) bludgeoning damage.",
        },
        {
          "name" => "Enslave",
          "desc" => "The aboleth targets one creature it can see within 30 ft. of it. The target must succeed on a DC 14 Wisdom saving throw or be magically charmed by the aboleth until the aboleth dies or until it is on a different plane of existence from the target. The charmed target is under the aboleth's control and can't take reactions, and the aboleth and the target can communicate telepathically with each other over any distance.\nWhenever the charmed target takes damage, the target can repeat the saving throw. On a success, the effect ends. No more than once every 24 hours, the target can also repeat the saving throw when it is at least 1 mile away from the aboleth.",
        }
      ],
      "legendary_actions" => [
        {
          "name" => "Detect",
          "desc" => "The aboleth makes a Wisdom (Perception) check."
        },
        {
          "name" => "Tail Swipe",
          "desc" => "The aboleth makes one tail attack."
        },
        {
          "name" => "Psychic Drain (Costs 2 Actions)",
          "desc" => "One creature charmed by the aboleth takes 10 (3d6) psychic damage, and the aboleth regains hit points equal to the damage the creature takes.",
        }
      ],
      "image" => "/api/images/monsters/aboleth.png",
      "url" => "/api/monsters/aboleth"
    }

    @monster = Monster.new(details)
  end

  it 'exists' do
    expect(@monster).to be_an_instance_of(Monster)
  end
  
  it 'has attributes' do
    expect(@monster.senses).to eq({
      "darkvision"=>"120 ft.",
      "passive_perception"=>20
    })
    expect(@monster.proficiencies).to eq([{"name"=>"Saving Throw: CON", "value"=>6}, {"name"=>"Saving Throw: INT", "value"=>8}, {"name"=>"Saving Throw: WIS", "value"=>6}, {"name"=>"Skill: History", "value"=>12}, {"name"=>"Skill: Perception", "value"=>10}])

    expect(@monster.damage_immunities).to eq([])
    expect(@monster.damage_vulnerabilities).to eq([])
    expect(@monster.damage_resistances).to eq([])
    expect(@monster.condition_immunities).to eq([])
    expect(@monster.proficiency_bonus).to eq(4)
    expect(@monster.size).to eq('Large')
    expect(@monster.type).to eq('aberration')
    expect(@monster.alignment).to eq('lawful evil')
    expect(@monster.armor_class).to eq("17")
    expect(@monster.speed).to eq(
      { 
        'walk' => '10 ft.', 
        'swim' => '40 ft.' 
      }
    )
    expect(@monster.hit_points).to eq(135)
    expect(@monster.strength).to eq(21)
    expect(@monster.dexterity).to eq(9)
    expect(@monster.constitution).to eq(15)
    expect(@monster.intelligence).to eq(18)
    expect(@monster.wisdom).to eq(15)
    expect(@monster.charisma).to eq(18)
    expect(@monster.languages).to eq('Deep Speech, telepathy 120 ft.')
    
    expect(@monster.special_abilities).to be_an(Array)
    expect(@monster.special_abilities.length).to eq(3)
    expect(@monster.special_abilities[0]).to eq(
      { 'name' => 'Amphibious', 
        'desc' => 'The aboleth can breathe air and water.' 
      }
    )
    expect(@monster.special_abilities[1]).to eq(
      {
        'name' => 'Mucous Cloud',
        'desc' => 'While underwater, the aboleth is surrounded by transformative mucus. A creature that touches the aboleth or that hits it with a melee attack while within 5 ft. of it must make a DC 14 Constitution saving throw. On a failure, the creature is diseased for 1d4 hours. The diseased creature can breathe only underwater.'
      }
    )
    expect(@monster.special_abilities[2]).to eq(
      {
        'name' => 'Probing Telepathy',
        'desc' => "If a creature communicates telepathically with the aboleth, the aboleth learns the creature's greatest desires if the aboleth can see the creature."
      }
    )
    
    expect(@monster.actions).to be_an(Array)
    expect(@monster.actions.length).to eq(4)
    expect(@monster.actions[0]).to eq(
      { 
        'name' => 'Multiattack', 
        'desc' => 'The aboleth makes three tentacle attacks.' 
      }
    )
    expect(@monster.actions[1]).to eq(
      {
        'name' => 'Tentacle',
        'desc' => 'Melee Weapon Attack: +9 to hit, reach 10 ft., one target. Hit: 12 (2d6 + 5) bludgeoning damage. If the target is a creature, it must succeed on a DC 14 Constitution saving throw or become diseased. The disease has no effect for 1 minute and can be removed by any magic that cures disease. After 1 minute, the diseased creature\'s skin becomes translucent and slimy, the creature can\'t regain hit points unless it is underwater, and the disease can be removed only by heal or another disease-curing spell of 6th level or higher. When the creature is outside a body of water, it takes 6 (1d12) acid damage every 10 minutes unless moisture is applied to the skin before 10 minutes have passed.'
      }
    )
    expect(@monster.actions[2]).to eq(
      { 
        'name' => 'Tail', 
        'desc' => 'Melee Weapon Attack: +9 to hit, reach 10 ft., one target. Hit: 15 (3d6 + 5) bludgeoning damage.' 
      }
    )
    expect(@monster.actions[3]).to eq(
      {
        'name' => 'Enslave',
        'desc' => "The aboleth targets one creature it can see within 30 ft. of it. The target must succeed on a DC 14 Wisdom saving throw or be magically charmed by the aboleth until the aboleth dies or until it is on a different plane of existence from the target. The charmed target is under the aboleth's control and can't take reactions, and the aboleth and the target can communicate telepathically with each other over any distance.\nWhenever the charmed target takes damage, the target can repeat the saving throw. On a success, the effect ends. No more than once every 24 hours, the target can also repeat the saving throw when it is at least 1 mile away from the aboleth."
      }
    )
    
    expect(@monster.legendary_actions).to be_an(Array)
    expect(@monster.legendary_actions.length).to eq(3)
    expect(@monster.legendary_actions[0]).to eq(
      { 
        'name' => 'Detect', 
        'desc' => 'The aboleth makes a Wisdom (Perception) check.' 
      }
    )
    expect(@monster.legendary_actions[1]).to eq(
      { 
        'name' => 'Tail Swipe', 
        'desc' => 'The aboleth makes one tail attack.' 
      }
    )
    expect(@monster.legendary_actions[2]).to eq(
      {
        'name' => 'Psychic Drain (Costs 2 Actions)',
        'desc' => 'One creature charmed by the aboleth takes 10 (3d6) psychic damage, and the aboleth regains hit points equal to the damage the creature takes.'
      }
    )
  end
end
