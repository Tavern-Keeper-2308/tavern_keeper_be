require 'rails_helper'

RSpec.describe Monster do
  # before(:each) do
  #   details = {
  #     size: "LARGE",
  #     type: "ABERRATION",
  #     alignment: "lawful evil",
  #     armor_class: [
  #         {
  #             value: 17
  #         }
  #     ],
  #     speed: {
  #         walk: "10 ft.",
  #         swim: "40 ft."
  #     },
  #     hit_points: 135,
  #     strength: 21,
  #     dexterity: 9,
  #     constitution: 15,
  #     intelligence: 18,
  #     wisdom: 15,
  #     charisma: 18,
  #     languages: "Deep Speech, telepathy 120 ft.",
  #     special_abilities: [
  #         {
  #             desc: "The aboleth can breathe air and water."
  #         },
  #         {
  #             desc: "While underwater, the aboleth is surrounded by transformative mucus. A creature that touches the aboleth or that hits it with a melee attack while within 5 ft. of it must make a DC 14 Constitution saving throw. On a failure, the creature is diseased for 1d4 hours. The diseased creature can breathe only underwater."
  #         },
  #         {
  #             desc: "If a creature communicates telepathically with the aboleth, the aboleth learns the creature's greatest desires if the aboleth can see the creature."
  #         }
  #     ],
  #     actions: [
  #         {
  #             desc: "The aboleth makes three tentacle attacks."
  #         },
  #         {
  #             desc: "Melee Weapon Attack: +9 to hit, reach 10 ft., one target. Hit: 12 (2d6 + 5) bludgeoning damage. If the target is a creature, it must succeed on a DC 14 Constitution saving throw or become diseased. The disease has no effect for 1 minute and can be removed by any magic that cures disease. After 1 minute, the diseased creature's skin becomes translucent and slimy, the creature can't regain hit points unless it is underwater, and the disease can be removed only by heal or another disease-curing spell of 6th level or higher. When the creature is outside a body of water, it takes 6 (1d12) acid damage every 10 minutes unless moisture is applied to the skin before 10 minutes have passed."
  #         },
  #         {
  #             desc: "Melee Weapon Attack: +9 to hit, reach 10 ft., one target. Hit: 15 (3d6 + 5) bludgeoning damage."
  #         },
  #         {
  #             desc: "The aboleth targets one creature it can see within 30 ft. of it. The target must succeed on a DC 14 Wisdom saving throw or be magically charmed by the aboleth until the aboleth dies or until it is on a different plane of existence from the target. The charmed target is under the aboleth's control and can't take reactions, and the aboleth and the target can communicate telepathically with each other over any distance.\nWhenever the charmed target takes damage, the target can repeat the saving throw. On a success, the effect ends. No more than once every 24 hours, the target can also repeat the saving throw when it is at least 1 mile away from the aboleth."
  #         }
  #     ],
  #     legendary_actions: [
  #         {
  #             desc: "The aboleth makes a Wisdom (Perception) check."
  #         },
  #         {
  #             desc: "The aboleth makes one tail attack."
  #         },
  #         {
  #             desc: "One creature charmed by the aboleth takes 10 (3d6) psychic damage, and the aboleth regains hit points equal to the damage the creature takes."
  #         }
  #     ]
  #   }
  #   @monster = Monster.new(details)
  # end

  before(:each) do
    monster_data = OpenStruct.new(
      index: 'aboleth',
      name: 'Aboleth',
      image: '/api/images/monsters/aboleth.png',
      size: 'LARGE',
      type: 'ABERRATION',
      alignment: 'lawful evil',
      armor_class: [OpenStruct.new(value: 17)],
      speed: OpenStruct.new(walk: '10 ft.', swim: '40 ft.'),
      hit_points: 135,
      strength: 21,
      dexterity: 9,
      constitution: 15,
      intelligence: 18,
      wisdom: 15,
      charisma: 18,
      languages: 'Deep Speech, telepathy 120 ft.',
      special_abilities: [
        OpenStruct.new(desc: 'The aboleth can breathe air and water.'),
        OpenStruct.new(
          desc: 'While underwater, the aboleth is surrounded by transformative mucus. A creature that touches the aboleth or that hits it with a melee attack while within 5 ft. of it must make a DC 14 Constitution saving throw. On a failure, the creature is diseased for 1d4 hours. The diseased creature can breathe only underwater.'
        ),
        OpenStruct.new(
          desc: "If a creature communicates telepathically with the aboleth, the aboleth learns the creature's greatest desires if the aboleth can see the creature."
        )
      ],
      actions: [
        OpenStruct.new(desc: 'The aboleth makes three tentacle attacks.'),
        OpenStruct.new(
          desc: 'Melee Weapon Attack: +9 to hit, reach 10 ft., one target. Hit: 12 (2d6 + 5) bludgeoning damage. If the target is a creature, it must succeed on a DC 14 Constitution saving throw or become diseased. The disease has no effect for 1 minute and can be removed by any magic that cures disease. After 1 minute, the diseased creature\'s skin becomes translucent and slimy, the creature can\'t regain hit points unless it is underwater, and the disease can be removed only by heal or another disease-curing spell of 6th level or higher. When the creature is outside a body of water, it takes 6 (1d12) acid damage every 10 minutes unless moisture is applied to the skin before 10 minutes have passed.'
        ),
        OpenStruct.new(desc: 'Melee Weapon Attack: +9 to hit, reach 10 ft., one target. Hit: 15 (3d6 + 5) bludgeoning damage.'),
        OpenStruct.new(
          desc: 'The aboleth targets one creature it can see within 30 ft. of it. The target must succeed on a DC 14 Wisdom saving throw or be magically charmed by the aboleth until the aboleth dies or until it is on a different plane of existence from the target. The charmed target is under the aboleth\'s control and can\'t take reactions, and the aboleth and the target can communicate telepathically with each other over any distance.\nWhenever the charmed target takes damage, the target can repeat the saving throw. On a success, the effect ends. No more than once every 24 hours, the target can also repeat the saving throw when it is at least 1 mile away from the aboleth.'
        )
      ],
      legendary_actions: [
        OpenStruct.new(desc: 'The aboleth makes a Wisdom (Perception) check.'),
        OpenStruct.new(desc: 'The aboleth makes one tail attack.'),
        OpenStruct.new(desc: 'One creature charmed by the aboleth takes 10 (3d6) psychic damage, and the aboleth regains hit points equal to the damage the creature takes.')
      ]
    )
    @monster = Monster.new(monster_data)
  end

  it 'exists' do
    expect(@monster).to be_an_instance_of(Monster)
  end

  # it 'has attributes' do
  #   expect(@monster.size).to eq("LARGE")
  #   expect(@monster.type).to eq("ABERRATION")
  #   expect(@monster.alignment).to eq("lawful evil")
  #   expect(@monster.armor_class).to eq([{ value: 17 }])
  #   expect(@monster.speed).to eq({ walk: "10 ft.", swim: "40 ft." })
  #   expect(@monster.hit_points).to eq(135)
  #   expect(@monster.strength).to eq(21)
  #   expect(@monster.dexterity).to eq(9)
  #   expect(@monster.constitution).to eq(15)
  #   expect(@monster.intelligence).to eq(18)
  #   expect(@monster.wisdom).to eq(15)
  #   expect(@monster.charisma).to eq(18)
  #   expect(@monster.languages).to eq("Deep Speech, telepathy 120 ft.")
  #   expect(@monster.special_abilities).to be_an(Array)
  #   expect(@monster.special_abilities.length).to eq(3)
  #   expect(@monster.special_abilities[0][:desc]).to eq("The aboleth can breathe air and water.")
  #   expect(@monster.special_abilities[1][:desc]).to eq("While underwater, the aboleth is surrounded by transformative mucus. A creature that touches the aboleth or that hits it with a melee attack while within 5 ft. of it must make a DC 14 Constitution saving throw. On a failure, the creature is diseased for 1d4 hours. The diseased creature can breathe only underwater.")
  #   expect(@monster.special_abilities[2][:desc]).to eq("If a creature communicates telepathically with the aboleth, the aboleth learns the creature's greatest desires if the aboleth can see the creature.")
  #   expect(@monster.actions).to be_an(Array)
  #   expect(@monster.actions.length).to eq(4)
  #   expect(@monster.actions[0][:desc]).to eq("The aboleth makes three tentacle attacks.")
  #   expect(@monster.actions[1][:desc]).to eq("Melee Weapon Attack: +9 to hit, reach 10 ft., one target. Hit: 12 (2d6 + 5) bludgeoning damage. If the target is a creature, it must succeed on a DC 14 Constitution saving throw or become diseased. The disease has no effect for 1 minute and can be removed by any magic that cures disease. After 1 minute, the diseased creature's skin becomes translucent and slimy, the creature can't regain hit points unless it is underwater, and the disease can be removed only by heal or another disease-curing spell of 6th level or higher. When the creature is outside a body of water, it takes 6 (1d12) acid damage every 10 minutes unless moisture is applied to the skin before 10 minutes have passed.")
  #   expect(@monster.actions[2][:desc]).to eq("Melee Weapon Attack: +9 to hit, reach 10 ft., one target. Hit: 15 (3d6 + 5) bludgeoning damage.")
  #   expect(@monster.actions[3][:desc]).to eq("The aboleth targets one creature it can see within 30 ft. of it. The target must succeed on a DC 14 Wisdom saving throw or be magically charmed by the aboleth until the aboleth dies or until it is on a different plane of existence from the target. The charmed target is under the aboleth's control and can't take reactions, and the aboleth and the target can communicate telepathically with each other over any distance.\nWhenever the charmed target takes damage, the target can repeat the saving throw. On a success, the effect ends. No more than once every 24 hours, the target can also repeat the saving throw when it is at least 1 mile away from the aboleth.")
  #   expect(@monster.legendary_actions).to be_an(Array)
  #   expect(@monster.legendary_actions.length).to eq(3)
  #   expect(@monster.legendary_actions[0][:desc]).to eq("The aboleth makes a Wisdom (Perception) check.")
  #   expect(@monster.legendary_actions[1][:desc]).to eq("The aboleth makes one tail attack.")
  #   expect(@monster.legendary_actions[2][:desc]).to eq("One creature charmed by the aboleth takes 10 (3d6) psychic damage, and the aboleth regains hit points equal to the damage the creature takes.")
  # end

  it 'has attributes' do
    expect(@monster.size).to eq('LARGE')
    expect(@monster.type).to eq('ABERRATION')
    expect(@monster.alignment).to eq('lawful evil')
    expect(@monster.armor_class).to eq(17)
    expect(@monster.speed).to eq({ walk: '10 ft.', swim: '40 ft.' })
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
    expect(@monster.special_abilities[0]).to eq('The aboleth can breathe air and water.')
    expect(@monster.special_abilities[1]).to eq(
      'While underwater, the aboleth is surrounded by transformative mucus. A creature that touches the aboleth or that hits it with a melee attack while within 5 ft. of it must make a DC 14 Constitution saving throw. On a failure, the creature is diseased for 1d4 hours. The diseased creature can breathe only underwater.'
    )
    expect(@monster.special_abilities[2]).to eq(
      "If a creature communicates telepathically with the aboleth, the aboleth learns the creature's greatest desires if the aboleth can see the creature."
    )
    expect(@monster.actions).to be_an(Array)
    expect(@monster.actions.length).to eq(4)
    expect(@monster.actions[0]).to eq('The aboleth makes three tentacle attacks.')
    expect(@monster.actions[1]).to eq(
      'Melee Weapon Attack: +9 to hit, reach 10 ft., one target. Hit: 12 (2d6 + 5) bludgeoning damage. If the target is a creature, it must succeed on a DC 14 Constitution saving throw or become diseased. The disease has no effect for 1 minute and can be removed by any magic that cures disease. After 1 minute, the diseased creature\'s skin becomes translucent and slimy, the creature can\'t regain hit points unless it is underwater, and the disease can be removed only by heal or another disease-curing spell of 6th level or higher. When the creature is outside a body of water, it takes 6 (1d12) acid damage every 10 minutes unless moisture is applied to the skin before 10 minutes have passed.'
    )
    expect(@monster.actions[2]).to eq('Melee Weapon Attack: +9 to hit, reach 10 ft., one target. Hit: 15 (3d6 + 5) bludgeoning damage.')
    expect(@monster.actions[3]).to eq(
      'The aboleth targets one creature it can see within 30 ft. of it. The target must succeed on a DC 14 Wisdom saving throw or be magically charmed by the aboleth until the aboleth dies or until it is on a different plane of existence from the target. The charmed target is under the aboleth\'s control and can\'t take reactions, and the aboleth and the target can communicate telepathically with each other over any distance.\nWhenever the charmed target takes damage, the target can repeat the saving throw. On a success, the effect ends. No more than once every 24 hours, the target can also repeat the saving throw when it is at least 1 mile away from the aboleth.'
    )
    expect(@monster.legendary_actions).to be_an(Array)
    expect(@monster.legendary_actions.length).to eq(3)
    expect(@monster.legendary_actions[0]).to eq('The aboleth makes a Wisdom (Perception) check.')
    expect(@monster.legendary_actions[1]).to eq('The aboleth makes one tail attack.')
    expect(@monster.legendary_actions[2]).to eq(
      'One creature charmed by the aboleth takes 10 (3d6) psychic damage, and the aboleth regains hit points equal to the damage the creature takes.'
    )
  end
end