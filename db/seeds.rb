# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

CATEGORIES = ["lead", "chords", "pads", "bassline", "drum pattern", "pluck"]
MOODS = ["uplifting", "happy", "dramatic", "sad", "melancholic", "cinematic", "aggressive", "chill"]

# generates 20 random midi files
20.times do
  # this will be executed 20 times
  Midi.create(
    title:
  )
end
