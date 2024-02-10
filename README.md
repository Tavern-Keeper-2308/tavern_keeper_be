
<a name="readme-top"></a>
<!-- PROJECT SHIELDS -->

[![Tavern Keeper](https://img.shields.io/badge/Tavern_Keeper-Visit_Website-purple?style=for-the-badge)](INSERT-DEPLOY-LINK)
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Issues][issues-shield]][issues-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/Tavern-Keeper-2308/tavern_keeper_be">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">Tavern Keeper</h3>

  <p align="left">
    This application is a Dungeons and Dragons Encounter Builder, with the intended user being a Dungeon Master. It allows the user to fill out a form to add encounter details including encounter name, party size, party level, summary, description, treasure & rewards, and monsters. Monsters from the D&D 5e compendium can be filtered and added based on size, name, hit points, and armor class attributes. 
    <br />
    <br />
    This GraphQL API handles the backend functionality including: 
    <ul align="left">
      <li><a href="https://www.dnd5eapi.co/docs/#overview--graphql">Consumption of third party D&D 5e GraphQL API</li>
      <li>Query endpoint(s) for display of created encounters as well as monster details</li>
      <li>Mutation endpoint(s) for creation of new encounters</li>
      <li>Current deploy GraphQL API endpoint: `https://tavern-keeper-be.onrender.com/graphql`</li>
    </ul>
    <br />
    <a href="https://github.com/Tavern-Keeper-2308/tavern_keeper_be"><strong>Explore Backend docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/Tavern-Keeper-2308/tavern-keeper-fe">Frontend Repository</a>
    ·
    <a href="https://github.com/Tavern-Keeper-2308/tavern_keeper_be/issues">Report Bug</a>
    ·
    <a href="https://github.com/Tavern-Keeper-2308/tavern_keeper_be/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
## Table of Contents
  1. [About The Project](#about-the-project)
      - [Built With](#built-with)
      - [Gems](#gems)
  2. [Getting Started](#getting-started)
      - [Installation](#installation)
      - [Testing](#testing)
  3. [Database](#database)
  4. [Endpoints](#endpoints)
      - [Query: getMonsters](#query-getmonsters)
      - [Query: getMonster](#query-getmonster)
      - [Query: getEncounters](#query-getencounters)
      - [Query: getEncounter](#query-getencounter)
      - [Mutation: createEncounter](#mutation-createencounter)
  5. [Roadmap](#roadmap)
  6. [Contributors](#contributors)



<!-- ABOUT THE PROJECT -->
## About The Project

[![Tavern Keeper](https://img.shields.io/badge/Tavern_Keeper-Visit_Website-purple?style=for-the-badge)](INSERT-DEPLOY-LINK)

### Built With
* [![Ruby on Rails][Rails-shield]][Rails-url]
* [![GraphQL][GraphQL-shield]][GraphQL-url]
* [![PostgreSQL][PostgreSQL-shield]][PostgreSQL-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Gems

#### Production

* [![graphql][gem-graphql]][gem-graphql-url]
* [![graphlient][gem-graphlient]][gem-graphlient-url]
* [![rack-cors][gem-rackcors]][gem-rackcors-url]
* [![factory_bot_rails][gem-factory_bot_rails]][gem-factory_bot_rails-url]
* [![faker][gem-faker]][gem-faker-url]

#### Development
* [![graphiqlrails][gem-graphiqlrails]][gem-graphiqlrails-url]

#### Testing
* [![rspec-rails][gem-rspec-rails]][gem-rspec-rails-url]
* [![simplecov][gem-simplecov]][gem-simplecov-url]
* [![factory_bot_rails][gem-factory_bot_rails]][gem-factory_bot_rails-url]
* [![faker][gem-faker]][gem-faker-url]
* [![shoulda-matchers][gem-shoulda-matchers]][gem-shoulda-matchers-url]
* [![webmock][gem-webmock]][gem-webmock-url]
* [![vcr][gem-vcr]][gem-vcr-url]
* [![pry][gem-pry]][gem-pry-url]
* [![debug][gem-debug]][gem-debug-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple example steps.

### Database 

<img src="images/schema.png"  width="300" height="800">

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/Tavern-Keeper-2308/tavern_keeper_be.git
   ```
2. Gem Bundle
   ```sh
    bundle
   ```
3. Rake
   ```sh
    rails db:{drop,create,migrate,seed}
   ```
4. To run on local server, [http://localhost:5000/](http://localhost:5000/)
   ```sh
    rails s
   ```
5. Live deploy via desired method



<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Testing
1. Run test suite
   ```sh
   bundle exec rspec
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ENDPOINTS -->
## Endpoints
1. Query endpoints are documented showing full scope of available attributes.
2. Attributes should all be written in queries and mutations using `camelCase`.
3. Some attributes are nested under another, using curly brackets `{}`.
  ```graphql
  attribute {
    nestedAttribute
    anotherNestedAttribute
  }
  ```
4. Query and Mutation requests can be modified to include only desired attribute data in the response.
5. Query and Mutation request attributes can be ordered designate the order of attributes in the response.
6. Variables for mutations can be input in any order.


### [INSERT-ENDPOINT-NAME-HERE](#INSERT-ENDPOINT-TAG_HERE)
- INSERT DETAILS HERE
- Requires variable(s):</br>
  `WHAT` - `DATATYPE` type</br>
- This endpoint is utilized by the frontend...

##### GraphQL Query/Mutation (MAKE SURE TO DELETE ONE THAT IT NOT IS)
```graphql
INSERT-QUERY-HERE
```
##### GraphQL Variable(s)
```graphql
INSERT-QUERY-HERE
```
##### Response
```json
INSERT-JSON-RESPONSE-HERE
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>




### [Query: getMonsters](#query-getmonsters)
- Gets list of all available monsters, with simple base attributes (Example only shows a few monsters, not full respsonse).
- This endpoint is utilized by the frontend for encounter creation, displaying all possible monster choices from the D&D 5e compendium.

##### GraphQL Query
```graphql
query getMonsters {
  monsters {
    monsterIndex
    monsterName
    size
    hitPoints
    armorClass
    type
    alignment
    challengeRating
  }
}
```
##### Response
```json
{
    "data": {
        "monsters": [
            {
                "monsterIndex": "acolyte",
                "monsterName": "Acolyte",
                "size": "MEDIUM",
                "hitPoints": 9,
                "armorClass": 10,
                "type": "HUMANOID",
                "alignment": "any alignment",
                "challengeRating": "0.25"
            },
            {
                "monsterIndex": "aboleth",
                "monsterName": "Aboleth",
                "size": "LARGE",
                "hitPoints": 135,
                "armorClass": 17,
                "type": "ABERRATION",
                "alignment": "lawful evil",
                "challengeRating": "10"
            },
            {
                "monsterIndex": "adult-black-dragon",
                "monsterName": "Adult Black Dragon",
                "size": "HUGE",
                "hitPoints": 195,
                "armorClass": 19,
                "type": "DRAGON",
                "alignment": "chaotic evil",
                "challengeRating": "14"
            }
        ]
    }
}
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>




### [Query: getMonster](#query-getmonster)
- Gets list of all monster details for a single monster by `index`.
- Requires variable(s):</br>
  `index` - `String` type.</br>
- This endpoint is utilized by the frontend for encounter details page, for monster details dropdowns.

##### GraphQL Query
```graphql
query getMonster($index: String!) {
    monster(index: $index) {
        monsterIndex
        monsterName
        size
        type
        armorClass
        speed {
            walk
            fly
            swim
        }
        hitPoints
        strength
        dexterity
        constitution
        intelligence
        wisdom
        charisma
        damageVulnerabilities
        damageResistances
        damageImmunities
        conditionImmunities
        proficiencyBonus
        proficiencies {
            name
            value
        }
        senses {
            blindsight
            darkvision
            passivePerception
        }
        specialAbilities {
            name
            desc
        }
        actions {
            name
            desc
        }
        legendaryActions {
            name
            desc
        }
    }
}
```
##### GraphQL Variable(s)
```graphql
{
    "index": "aboleth"
}
```
##### Response
```json
{
    "data": {
        "monster": {
            "monsterIndex": "aboleth",
            "monsterName": "Aboleth",
            "size": "LARGE",
            "type": null,
            "armorClass": 17,
            "speed": {
                "walk": "10 ft.",
                "fly": null,
                "swim": "40 ft."
            },
            "hitPoints": 135,
            "strength": 21,
            "dexterity": 9,
            "constitution": 15,
            "intelligence": 18,
            "wisdom": 15,
            "charisma": 18,
            "damageVulnerabilities": "[]",
            "damageResistances": "[]",
            "damageImmunities": "[]",
            "conditionImmunities": [],
            "proficiencyBonus": 4,
            "proficiencies": [
                {
                    "name": "Saving Throw: CON",
                    "value": "6"
                },
                {
                    "name": "Saving Throw: INT",
                    "value": "8"
                },
                {
                    "name": "Saving Throw: WIS",
                    "value": "6"
                },
                {
                    "name": "Skill: History",
                    "value": "12"
                },
                {
                    "name": "Skill: Perception",
                    "value": "10"
                }
            ],
            "senses": {
                "blindsight": null,
                "darkvision": "120 ft.",
                "passivePerception": "20"
            },
            "specialAbilities": [
                {
                    "name": "Amphibious",
                    "desc": "The aboleth can breathe air and water."
                },
                {
                    "name": "Mucous Cloud",
                    "desc": "While underwater, the aboleth is surrounded by transformative mucus. A creature that touches the aboleth or that hits it with a melee attack while within 5 ft. of it must make a DC 14 Constitution saving throw. On a failure, the creature is diseased for 1d4 hours. The diseased creature can breathe only underwater."
                },
                {
                    "name": "Probing Telepathy",
                    "desc": "If a creature communicates telepathically with the aboleth, the aboleth learns the creature's greatest desires if the aboleth can see the creature."
                }
            ],
            "actions": [
                {
                    "name": "Multiattack",
                    "desc": "The aboleth makes three tentacle attacks."
                },
                {
                    "name": "Tentacle",
                    "desc": "Melee Weapon Attack: +9 to hit, reach 10 ft., one target. Hit: 12 (2d6 + 5) bludgeoning damage. If the target is a creature, it must succeed on a DC 14 Constitution saving throw or become diseased. The disease has no effect for 1 minute and can be removed by any magic that cures disease. After 1 minute, the diseased creature's skin becomes translucent and slimy, the creature can't regain hit points unless it is underwater, and the disease can be removed only by heal or another disease-curing spell of 6th level or higher. When the creature is outside a body of water, it takes 6 (1d12) acid damage every 10 minutes unless moisture is applied to the skin before 10 minutes have passed."
                },
                {
                    "name": "Tail",
                    "desc": "Melee Weapon Attack: +9 to hit, reach 10 ft., one target. Hit: 15 (3d6 + 5) bludgeoning damage."
                },
                {
                    "name": "Enslave",
                    "desc": "The aboleth targets one creature it can see within 30 ft. of it. The target must succeed on a DC 14 Wisdom saving throw or be magically charmed by the aboleth until the aboleth dies or until it is on a different plane of existence from the target. The charmed target is under the aboleth's control and can't take reactions, and the aboleth and the target can communicate telepathically with each other over any distance.\nWhenever the charmed target takes damage, the target can repeat the saving throw. On a success, the effect ends. No more than once every 24 hours, the target can also repeat the saving throw when it is at least 1 mile away from the aboleth."
                }
            ],
            "legendaryActions": [
                {
                    "name": "Detect",
                    "desc": "The aboleth makes a Wisdom (Perception) check."
                },
                {
                    "name": "Tail Swipe",
                    "desc": "The aboleth makes one tail attack."
                },
                {
                    "name": "Psychic Drain (Costs 2 Actions)",
                    "desc": "One creature charmed by the aboleth takes 10 (3d6) psychic damage, and the aboleth regains hit points equal to the damage the creature takes."
                }
            ]
        }
    }
}
```
<p align="right">(<a href="#readme-top">back to top</a>)</p>




### [Query: getEncounters](#query-getencounters)
- Gets list of all encounters for a single user, by `userName`.
- Requires variable(s):</br>
  `userName` -  `String` type</br>
- This endpoint is used by frontend to create an index page displaying all encounters created by a single user.

##### GraphQL Query
```graphql
query getEncounters($userName: String!) {
    encounters(userName: $userName) {
        id
        userName
        encounterName
        partySize
        partyLevel
        summary
        description
        treasure
        encounterMonsters {
            monsterName
        }
    }
}
```
##### GraphQL Variable(s)
```graphql
{
    "userName": "demo-many-encounters"
}
```
##### Response
```json
{
    "data": {
        "encounters": [
            {
                "id": "2",
                "userName": "demo-many-encounters",
                "encounterName": "Ph'nglui mglw'nafh Cthulhu R'lyeh wgah'nagl fhtagn",
                "partySize": 1,
                "partyLevel": 3,
                "summary": "Ere iron was found or tree was hewn",
                "description": "Gambrel fungus antiquarian gibbous gibbering unnamable. Furtive blasphemous cyclopean comprehension manuscript non-euclidean tentacles decadent. Antediluvian shunned mortal. Squamous non-euclidean cyclopean eldritch tenebrous gibbering charnel. Cyclopean stench furtive gibbering.",
                "treasure": "Amulet of Kynareth",
                "encounterMonsters": [
                    {
                        "monsterName": "Giant Shark"
                    },
                    {
                        "monsterName": "Aboleth"
                    },
                    {
                        "monsterName": "Aboleth"
                    }
                ]
            },
            {
                "id": "3",
                "userName": "demo-many-encounters",
                "encounterName": "Rawr R'lyeh wgah'nagl Ph'n ui mglw'nafh gl fhtagn",
                "partySize": 1,
                "partyLevel": 13,
                "summary": "Under the mountain dark and tall",
                "description": "Mortal madness furtive gibbering stygian. Mortal singular amorphous stygian stench antiquarian. Non-euclidean furtive decadent accursed comprehension cyclopean foetid fungus. Madness spectral stench charnel indescribable comprehension unutterable.",
                "treasure": "Gold and Ruby Circlet",
                "encounterMonsters": [
                    {
                        "monsterName": "Goblin"
                    },
                    {
                        "monsterName": "Goblin"
                    }
                ]
            },
            {
                "id": "4",
                "userName": "demo-many-encounters",
                "encounterName": "Tnafh Dargrlw'l fhtagne R'Ph'nglui mg",
                "partySize": 3,
                "partyLevel": 9,
                "summary": "The Fall of Gil-galad",
                "description": "Antiquarian stygian lurk charnel unnamable furtive. Non-euclidean blasphemous unmentionable dank stygian immemorial. Effulgence gibbous foetid antediluvian ululate non-euclidean gibbering squamous. Antediluvian daemoniac dank.",
                "treasure": "Nightweaver's Band",
                "encounterMonsters": [
                    {
                        "monsterName": "Aboleth"
                    },
                    {
                        "monsterName": "Aboleth"
                    }
                ]
            }
        ]
    }
}
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>




### [Query: getEncounter](#query-getencounter)
- Gets details for a single encounter, by encounter `id`
- Requires variable(s):</br>
  `id` - `Integer` type</br>
- This endpoint is utilized by the frontend for create a display page for a single encounter.

##### GraphQL Query
```graphql
query getEncounter($id: ID!) {
    encounter(id: $id) {
        id
        userName
        encounterName
        partySize
        partyLevel
        summary
        description
        treasure
        encounterMonsters {
            monsterName
            monsterIndex
        }
    }
}
```
##### GraphQL Variable(s)
```graphql
{
    "id": 2
}
```
##### Response
```json
{
    "data": {
        "encounter": {
            "id": "2",
            "userName": "demo-many-encounters",
            "encounterName": "Ph'nglui mglw'nafh Cthulhu R'lyeh wgah'nagl fhtagn",
            "partySize": 1,
            "partyLevel": 3,
            "summary": "Ere iron was found or tree was hewn",
            "description": "Gambrel fungus antiquarian gibbous gibbering unnamable. Furtive blasphemous cyclopean comprehension manuscript non-euclidean tentacles decadent. Antediluvian shunned mortal. Squamous non-euclidean cyclopean eldritch tenebrous gibbering charnel. Cyclopean stench furtive gibbering.",
            "treasure": "Amulet of Kynareth",
            "encounterMonsters": [
                {
                    "monsterName": "Giant Shark",
                    "monsterIndex": "giant-shark"
                },
                {
                    "monsterName": "Aboleth",
                    "monsterIndex": "aboleth"
                },
                {
                    "monsterName": "Aboleth",
                    "monsterIndex": "aboleth"
                }
            ]
        }
    }
}
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>




### [Mutation: createEncounter](#mutation-createencounter)
- Creates a new encounter based on input variables, `userName`, `encounterName`, `partySize`, `partyLevel`, `summary`, `description`, `treasure`, and `encounterMonsterIndexes` (this is an array of monster index strings).
- Requires variable(s):</br>
  `userName` - `String` type</br>
  `encounterName` - `String` type</br>
  `partySize` - `Integer` type</br>
  `partyLevel` - `Integer` type</br>
  `summary` - `String` type</br>
  `description` - `String` type</br>
  `treasure` - `String` type</br>
  `encounterMonsterIndexes` - [`String`] type</br>
- This endpoint is utilized by the frontend to create a new encounter from user input on encounter builder page.

##### GraphQL Mutation
```graphql
mutation CreateEncounter($userName: String!, $encounterName: String!, $partySize: Int!, $partyLevel: Int!, $summary: String!, $description: String!, $treasure: String!, $encounterMonsterIndexes: [String!]!) {
    createEncounter(input: {
        userName: $userName,
        encounterName: $encounterName,
        partySize: $partySize,
        partyLevel: $partyLevel,
        summary: $summary,
        description: $description,
        treasure: $treasure,
        encounterMonsterIndexes: $encounterMonsterIndexes
    }) {
        encounter {
            userName
            id
            encounterName
            partySize
            partyLevel
            summary
            description
            treasure
            encounterMonsters {
                monsterIndex
                monsterName
            }
        }
        errors
    }
}    
```
##### GraphQL Variable(s)
```graphql
{
  "userName": "WhoAmI",
  "encounterName": "Party Wipe",
  "partySize": 4,
  "partyLevel": 3,
  "summary": "I hope this works",
  "description": "Why does it have to be a string",
  "treasure": "We not deserve anything",
  "encounterMonsterIndexes": ["beholder", "goblin","goblin", "adult-black-dragon"]
}
```
##### Response
```json
{
    "data": {
        "createEncounter": {
            "encounter": {
                "userName": "WhoAmI",
                "id": "13",
                "encounterName": "Party Wipe",
                "partySize": 4,
                "partyLevel": 3,
                "summary": "I hope this works",
                "description": "Why does it have to be a string",
                "treasure": "We not deserve anything",
                "encounterMonsters": [
                    {
                        "monsterIndex": "beholder",
                        "monsterName": "Beholder"
                    },
                    {
                        "monsterIndex": "goblin",
                        "monsterName": "Goblin"
                    },
                    {
                        "monsterIndex": "goblin",
                        "monsterName": "Goblin"
                    },
                    {
                        "monsterIndex": "adult-black-dragon",
                        "monsterName": "Adult Black Dragon"
                    }
                ]
            },
            "errors": []
        }
    }
}
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- ROADMAP -->
## Roadmap

- [ ] Database Schema
- [ ] Set Up Mock Server on Postman (browser version)
    - [ ] JSON Contracts
- [ ] Configure gems and GraphQL for creating an API
- [ ] CircleCI and Render CI/CD
- [ ] Set up consumption architecture using Service/Facade/Poro design pattern
- [ ] Query: `getMonsters`, gets list of monsters with attributes used for filter and create page
    - [ ] Set up `MonsterType` class under `Types` module
    - [ ] Set up `:monster` field in `QueryType` class
    - [ ] Testing - TDD and Postman



See the [open issues](https://github.com/Tavern-Keeper-2308/tavern_keeper_be/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- CONTACT -->
## Contact

Organization: Tavern Keeper

Organization Link: [https://github.com/Tavern-Keeper-2308](https://github.com/Tavern-Keeper-2308)

Project Link: [https://github.com/Tavern-Keeper-2308/tavern_keeper_be](https://github.com/Tavern-Keeper-2308/tavern_keeper_be)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Contributors

Xander Hendry 

[![LinkedIn][linkedin-shield]][linkedin-url-zh]
[![GitHub][github-shield-zh]][github-url-zh]


Sam Tran 

[![LinkedIn][linkedin-shield]][linkedin-url-st]
[![GitHub][github-shield-st]][github-url-st]


Kevin Zolman 

[![LinkedIn][linkedin-shield]][linkedin-url-kz]
[![GitHub][github-shield-kz]][github-url-kz]


Erica Hagle 

[![LinkedIn][linkedin-shield]][linkedin-url-eh] 
[![GitHub][github-shield-eh]][github-url-eh]


Arden Ranta 

[![LinkedIn][linkedin-shield]][linkedin-url-ar] 
[![GitHub][github-shield-ar]][github-url-ar]




<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/Tavern-Keeper-2308/tavern_keeper_be.svg?style=for-the-badge
[contributors-url]: https://github.com/Tavern-Keeper-2308/tavern_keeper_be/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Tavern-Keeper-2308/tavern_keeper_be.svg?style=for-the-badge
[forks-url]: https://github.com/Tavern-Keeper-2308/tavern_keeper_be/network/members
[stars-shield]: https://img.shields.io/github/stars/Tavern-Keeper-2308/tavern_keeper_be.svg?style=for-the-badge
[stars-url]: https://github.com/Tavern-Keeper-2308/tavern_keeper_be/stargazers
[issues-shield]: https://img.shields.io/github/issues/Tavern-Keeper-2308/tavern_keeper_be.svg?style=for-the-badge
[issues-url]: https://github.com/Tavern-Keeper-2308/tavern_keeper_be/issues
[license-shield]: https://img.shields.io/github/license/Tavern-Keeper-2308/tavern_keeper_be.svg?style=for-the-badge
[license-url]: https://github.com/Tavern-Keeper-2308/tavern_keeper_be/blob/master/LICENSE.txt
[product-screenshot]: images/screenshot.png

<!-- BUILD WITH SHIELDS -->
[Rails-shield]: https://img.shields.io/badge/Ruby%20on%20Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white
[Rails-url]: https://rubyonrails.org/

[GraphQL-shield]: https://img.shields.io/badge/GraphQL-E10098?style=for-the-badge&logo=GraphQL&logoColor=white
[GraphQL-url]: https://graphql.org/

[PostgreSQL-shield]: https://img.shields.io/badge/PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white
[PostgreSQL-url]: https://www.postgresql.org/

[HTML-shield]: https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white
[HTML-url]: https://developer.mozilla.org/en-US/docs/Web/HTML

[JavaScript-shield]: https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black
[JavaScript-url]: https://developer.mozilla.org/en-US/docs/Web/JavaScript

[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com

<!-- GEM SHIELDS -->
[gem-debug]: https://img.shields.io/badge/debug-1.9.1-brightgreen?style=flat-square
[gem-debug-url]: https://rubygems.org/gems/debug

[gem-rspec-rails]: https://img.shields.io/badge/rspec--rails-6.1.0-green?style=flat-square
[gem-rspec-rails-url]: https://github.com/rspec/rspec-rails

[gem-simplecov]: https://img.shields.io/badge/simplecov-0.22.0-yellow?style=flat-square
[gem-simplecov-url]: https://github.com/simplecov-ruby/simplecov

[gem-factory_bot_rails]: https://img.shields.io/badge/factory_bot_rails-6.4.0-success?style=flat-square
[gem-factory_bot_rails-url]: https://github.com/thoughtbot/factory_bot_rails

[gem-faker]: https://img.shields.io/badge/faker-3.2.2-red?style=flat-square
[gem-faker-url]: https://github.com/faker-ruby/faker

[gem-pry]: https://img.shields.io/badge/pry-0.14.2-yellow?style=flat-square
[gem-pry-url]: https://github.com/pry/pry

[gem-shoulda-matchers]: https://img.shields.io/badge/shoulda--matchers-6.0.0-orange?style=flat-square
[gem-shoulda-matchers-url]: https://github.com/thoughtbot/shoulda-matchers

[gem-faraday]: https://img.shields.io/badge/faraday-2.8.1-yellowgreen?style=flat-square
[gem-faraday-url]: https://github.com/lostisland/faraday

[gem-figaro]: https://img.shields.io/badge/figaro-1.2.0-critical?style=flat-square
[gem-figaro-url]: https://github.com/laserlemon/figaro

[gem-jsonapi-serializer]: https://img.shields.io/badge/jsonapi--serializer-2.2.0-blue?style=flat-square
[gem-jsonapi-serializer-url]: https://github.com/jsonapi-serializer/jsonapi-serializer

[gem-capybara]: https://img.shields.io/badge/capybara-3.39.2-brightgreen?style=flat-square
[gem-capybara-url]: https://github.com/teamcapybara/capybara

[gem-webmock]: https://img.shields.io/badge/webmock-3.19.1-yellowgreen?style=flat-square
[gem-webmock-url]: https://github.com/bblimke/webmock

[gem-vcr]: https://img.shields.io/badge/vcr-6.2.0-orange?style=flat-square
[gem-vcr-url]: https://github.com/vcr/vcr

[gem-rackcors]: https://img.shields.io/badge/rack--cors-2.0.1-9b59b6?style=flat-square&label=rack-cors
[gem-rackcors-url]: https://github.com/cyu/rack-cors

[gem-graphql]: https://img.shields.io/badge/graphql-2.2.8-E10098?style=flat-square
[gem-graphql-url]: https://graphql-ruby.org/getting_started.html

[gem-graphlient]: https://img.shields.io/badge/graphlient-0.8.0-6495ED?style=flat-square
[gem-graphlient-url]: https://github.com/ashkan18/graphlient

[gem-graphiqlrails]: https://img.shields.io/badge/graphiql--rails-1.9.0-00CED1?style=flat-square
[gem-graphiqlrails-url]: https://github.com/rmosolgo/graphiql-rails


<!-- CONTRIBUTOR SHIELDS AND URLS -->
[github-shield-zh]: https://img.shields.io/badge/GitHub-XanderHendry-success?style=for-the-badge&logo=github
[github-url-zh]: https://github.com/xanderhendry

[github-shield-st]: https://img.shields.io/badge/GitHub-Sykogst-success?style=for-the-badge&logo=github
[github-url-st]: https://github.com/Sykogst

[github-shield-kz]: https://img.shields.io/badge/GitHub-zkevkev-success?style=for-the-badge&logo=github
[github-url-kz]: https://github.com/zkevkev

[github-shield-eh]: https://img.shields.io/badge/GitHub-ericahagle-success?style=for-the-badge&logo=github
[github-url-eh]: https://github.com/ericahagle

[github-shield-ar]: https://img.shields.io/badge/GitHub-tenthwalker-success?style=for-the-badge&logo=github
[github-url-ar]: https://github.com/tenthwalker

<!-- LINKEDIN SHIELDS AND URLS-->
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url-st]: https://www.linkedin.com/in/sam-t-tran
[linkedin-url-kz]: https://www.linkedin.com/in/kevin-zolman
[linkedin-url-zh]: https://www.linkedin.com/in/xander-hendry-70b804289
[linkedin-url-eh]: https://www.linkedin.com/in/ericahagle
[linkedin-url-ar]: https://www.linkedin.com/in/arden-ranta/