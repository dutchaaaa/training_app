# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Week.create( reps1: 5,
  reps2: 5,
  reps3: 5,
  percent_of_max1: 0.75,
  percent_of_max2: 0.8,
  percent_of_max3: 0.85
   )

Week.create( reps1: 3,
  reps2: 3,
  reps3: 3,
  percent_of_max1: 0.8,
  percent_of_max2: 0.85,
  percent_of_max3: 0.9
   )

Week.create( reps1: 5,
  reps2: 3,
  reps3: 1,
  percent_of_max1: 0.75,
  percent_of_max2: 0.8,
  percent_of_max3: 0.85
   )

Week.create( reps1: 5,
  reps2: 5,
  reps3: 5,
  percent_of_max1: 0.60,
  percent_of_max2: 0.65,
  percent_of_max3: 0.70
   )