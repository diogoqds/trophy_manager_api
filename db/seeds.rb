# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

coin_award = AwardEntity.create(name: 'CollectedCoin')

Rule.create([
  { value: 1, award_entity: coin_award },
  { value: 100, award_entity: coin_award },
  { value: 1000, award_entity: coin_award },
  { value: 10_000, award_entity: coin_award },
  { value: 100_000, award_entity: coin_award }
])

death_award = AwardEntity.create(name: 'Death')

Rule.create([
   { value: 1, award_entity: death_award },
   { value: 10, award_entity: death_award },
   { value: 25, award_entity: death_award },
   { value: 50, award_entity: death_award },
   { value: 100, award_entity: death_award }
 ])

turtle = Monster.create(name: 'Turtle')
bowser = Monster.create(name: 'Bowser')

turtle_award = AwardEntity.create(name: turtle.name, entity: turtle)
bowser_award = AwardEntity.create(name: bowser.name, entity: bowser)

Rule.create([
     { value: 1, award_entity: turtle_award },
     { value: 100, award_entity: turtle_award },
     { value: 1000, award_entity: turtle_award },
     { value: 10_000, award_entity: turtle_award },
     { value: 100_000, award_entity: turtle_award },

     { value: 1, award_entity: bowser_award },
     { value: 100, award_entity: bowser_award },
     { value: 1000, award_entity: bowser_award },
     { value: 10_000, award_entity: bowser_award },
     { value: 100_000, award_entity: bowser_award }
   ])