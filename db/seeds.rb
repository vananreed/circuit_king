# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Circuit.destroy_all
Exercise.destroy_all

Exercise.create(name: "Burpees",
            description: "1. Perform Pushup.
            2. Jump feet up to hands.
            3. Squat, shoot hands to the sky and jump.
            4. Return to plank and repeat",
            difficulty: "difficult"
            )

Exercise.create(name: "Diamond Push Ups",
            description: "1. Assume plank position with narrow hand stance, thumbs should be touching.
            2. Lower chest to hands.
            3. Push upwards and return to plank.
            4. Repeat",
            difficulty: "difficult"
            )
Exercise.create(name: "Air Squats",
            description: "1. Stand with feet shoulder width apart.
            2. Bend legs down passed a 90 degree angle.
            3. Push upwards and return to standing.
            4. Repeat",
            difficulty: "easy"
            )

circuit = Circuit.new(name: "Muscle Blaster")
circuit.exercises = [Exercise.first, Exercise.last]
circuit.save!
