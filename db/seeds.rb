# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts "User.destroy_all"
User.destroy_all

# creates categories based on CATEGORIES array
CATEGORIES = ["lead", "chords", "pads", "bassline", "drum pattern", "pluck", ""]
Category.destroy_all
CATEGORIES.each do |category|
  puts "creating a category:"
  cat = Category.create(
    {
      name: category
    }
  )
  puts "created #{cat.name} - Category"
end

# creates moods based on MOODS array
MOODS = ["uplifting", "happy", "dramatic", "sad", "melancholic", "cinematic", "aggressive", "chill", ""]
Mood.destroy_all
MOODS.each do |mood|
  puts "creating a mood:"
  md = Mood.create(
    {
      name: mood
    }
  )
  puts "created #{md.name} - mood"
end

# for sake of seeding:
TIME_SIGNATURES = ["2/4", "3/4", "4/4", "2/2", "3/2", "4/2", "2/8", "3/8", "4/8"]

# creates 15 random users
# User.create(email: "gerald@gmx.de", password: "12345")

15.times do
  puts "creating a user:"
  user = User.create(
    {
      username: Faker::Name.unique.name,
      email: Faker::Internet.unique.email,
      password: '123456'
    }
  )
  puts "created #{user.email}"
end

# generates 20 random midi files
# puts "Midi.destroy_all"
# Midi.destroy_all

20.times do
  # this will be executed 20 times
  puts "creating a midi:"
  midi = Midi.create(
    {
      title: Faker::Music.album,
      key_signature: Faker::Music.key,
      time_signature: TIME_SIGNATURES.sample,
      user_id: User.pluck(:id).sample
    }
  )

  # creating between 0 and 4 moods for a single midi
  arr_mood = Mood.all.sample(4)
  i = 0
  rand(0..4).times do
    MidiMood.create(
      {
        midi: midi,
        # mood: Mood.all.shuffle[0]
        mood: arr_mood[i]
      }
    )
    i += 1
  end

  # creating between 0 and 3 categories for a single midi
  arr_category = Category.all.sample(4)
  y = 0
  rand(0..3).times do
    MidiCategory.create(
      {
        midi: midi,
        category: arr_category[y]
      }
    )
    y += 1
  end

  puts "created #{midi.title}"
end
