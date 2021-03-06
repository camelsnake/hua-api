# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding database"

require 'ffaker'
FFaker::Random.seed = 1337

# A bit of configuration
NUM_PARTICIPANTS = 30
NUM_MOVIES = 300
MAX_PARTICIPANTS_PER_MOVIE = 10
MAX_AUTHORS_PER_MOVIE = 3

# Base data - departments and role types
puts "Generating departments and role types"

departments = 'Director, Scenarist, Producer, Cameraman, Editor, Composer, Sound FX artist, Animator, Compositor, Designer, Background painter, 2D artist, 3D artist, 4D artist'.split(',')
role_types = %w(Main Assistant Regular Irregular)
  
departments.each do |dept_name|
  department = Department.create({name: dept_name})
  role_types.each do |role_type| 
    RoleType.create({name: "#{role_type} #{dept_name}", department: department})
  end
end

# Base data - participant types
puts "Generating participant types"
%w(person organisation).each {|t| ParticipantType.create({name: t})}

# Random data - participants 
puts "Generating #{NUM_PARTICIPANTS} participants"
participant_type_length = ParticipantType.count
NUM_PARTICIPANTS.times do
  participant_type = ParticipantType.find(FFaker::Random.rand(participant_type_length)+1)
  if participant_type.name === 'person'
    name = FFaker::Name.name
  else
    name = FFaker::Company.name
  end

  Participant.create({name: name, participant_type: participant_type})
end

# Random data - movies
puts "Attempting to generate #{NUM_MOVIES} movies"
num_discarded = 0
NUM_MOVIES.times do
  begin
    Movie.create({name: FFaker::Movie.title, description: FFaker::CheesyLingo.paragraph})
  rescue ActiveRecord::RecordNotUnique
    num_discarded += 1
  end
end
puts "  #{NUM_MOVIES - num_discarded} movies generated (#{num_discarded} discarded due to dupliacte titles)"

# Random join data - movie roles and authors
puts "Generating relation data - this may take a while.."
participant_ids = (1..Participant.count).to_a
Movie.all.each do |movie|
  num_authors = FFaker::Random.rand(MAX_AUTHORS_PER_MOVIE) + 1
  num_participants = FFaker::Random.rand(MAX_PARTICIPANTS_PER_MOVIE) + 1
  puts "Generating data for movie ##{movie.id} '#{movie.name}' - #{num_authors} authors and #{num_participants} participants"

  FFaker::ArrayUtils.shuffle(participant_ids).take(num_authors).each{|author_id| movie.authors << Participant.find(author_id)}

  FFaker::ArrayUtils.shuffle(participant_ids).take(num_participants).each do |participant_id| 
    role_type = RoleType.find(FFaker::Random.rand(RoleType.count)+1)
    participant = Participant.find(participant_id)
    Role.create({movie: movie, role_type: role_type, participant: participant})
  end 
end

puts "Seeding done!"
