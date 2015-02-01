require 'sinatra'
require 'json'
require 'kramdown'

require './lib/player'

East = [
  Player.new("D'Marcus Williums", "Univeristy of Georgia"),
  Player.new("T.J. Juckson", "Wayne State University"),
  Player.new("T'Variusness King", "Merrimack College"),
  Player.new("Tyroil Smoochie-Wallace", "University of Miami"),
  Player.new("D'Squarius Green, Jr.", "University of Notre Dame"),
  Player.new("Ibrahim Moizoos", "University of Tennessee at Chattanooga"),
  Player.new("Jackmerius Tacktheritrix", "Michigan State University"),
  Player.new("D'Isiah T. Billings-Clyde", "Coastal Carolina University"),
  Player.new("D'Jasper Probincrux III", "South Carolina State University"),
  Player.new("Leoz Maxwell Jilliumz", "East Carolina University"),
  Player.new("Javaris Jamar Javarison-Lamar", "University of Middle Tennessee"),
  Player.new("Davoin Shower-Handel", "University of Southern Mississippi"),
  Player.new("Hingle McCringleberry", "Penn State University"),
  Player.new("L'Carpetron Dookmarriot", "Florida Atlantic University"),
  Player.new("J'Dinkalage Morgoone", "University of South Florida"),
  Player.new("Xmus Jaxon Flaxon-Waxon", "California University of Pennsylvania"),
  # College Bowl 2
  Player.new("Coznesster Smiff", "Rutgers University"),
  Player.new("Elipses Corter", "University of Alabama"),
  Player.new("Nyquillus Dillwad", "LSU"),
  Player.new("Bismo Funyuns", "Florida State University"),
  Player.new("Decatholac Mango", "Georgia Tech University"),
  Player.new("Mergatroid Skittle", "University of Louisville"),
  Player.new("Quiznatodd Bidness", "University of Tennessee"),
  Player.new("D'Pez Poopsie", "Ol' Miss University"),
  Player.new("Quackadilly Blip", "Auburn University"),
  Player.new("Goolius Boozler", "The U"),
  Player.new("Bisquiteen Trisket", "University of Michigan"),
  Player.new("Fartrell Cluggins", "Arkansas University"),
  Player.new("Blyrone Blashinton", "Syracuse University"),
  Player.new("Cartoons Plural", "Virginia Tech University"),
  Player.new("Jammie Jammie-Jammie", "The Ohio State University"),
  Player.new("Fudge"),
  # Pro Edition
  Player.new("Creme de la Creme", "Vanderbilt University"),
  Player.new("Cosgrove Shumway", "Clemson University"),
  Player.new("Ha Ha Clinton-Dix", "University of Alabama"),
  Player.new("Doink Ahanahue", "Marshall University"),
  Player.new("Legume Duprix", "West Virginia University"),
  Player.new("Leger Douzable", "University of Central Florida"),
  Player.new("Quisperny G'Dunzoid Sr.", "Central Connecticut State University"),
  Player.new("Grunky Peep", "Georgia Southern University"),
  Player.new("D'Brickashaw Ferguson", "University of Virginia"),
  Player.new("Strunk Flugget", "University of South Carolina"),
  Player.new("Stumptavian Roboclick", "Grambling State University"),
  Player.new("Cornelius 'Tank' Carradine", "Florida State University"),
  Player.new("Vagonius Thicket-Suede", "Duke University"),
  Player.new("Marmadune Shazbot", "Tulane University"),
  Player.new("Swordless Mimetown", "Jacksonville State University")
]

West = [
  Player.new("Saggitariutt Jefferspin", "Texas A&M"),
  Player.new("D'Glester Hardunkichud", "University of Wisconsin"),
  Player.new("Swirvithan L'Goodling-Splatt", "Saskatchewan University"),
  Player.new("Quatro Quatro", "San Jose State University"),
  Player.new("Ozamataz Buckshank", "Stanford University"),
  Player.new("Beezer Twelve Washingbeard", "Jones College"),
  Player.new("Shakiraquan T.G.I.F. Carter", "University of Northern Arizona"),
  Player.new("X-Wing @Aliciousness", "Missouri Western State University"),
  Player.new("Sequester Grundelplith M.D.", "Adams State"),
  Player.new("Scoish Velociraptor Maloish", "South Dakota State University"),
  Player.new("T.J. A.J. R.J. Backslashinfourth V", "Albion College"),
  Player.new("Eeeee Eeeeeeeee", "San Diego State University"),
  Player.new("Donkey Teeth", "Boise State University"),
  Player.new("Torque (construction noise) Lewith", "Nevada State Penitentiary"),
  Player.new("\u2A17 (the player formerly known as Mousecop)", "University of Missouri-Columbia"),
  Player.new("Dan Smith", "BYU"),
  # College Bowl 2
  Player.new("Equine Ducklings", "Indiana University Purdue University Indianapolis"),
  Player.new("Dahistorius Lamystorius", "Utah State University"),
  Player.new("Ewokoniad Sigourneth Juniorstein", "Oklahoma State University"),
  Player.new("Eqqsnuizitine Buble-Schwinslow", "University of Nebraska"),
  Player.new("Huka'lakanaka Hakanakaheekalucka'hukahakafaka", "University of Hawaii"),
  Player.new("King Prince Chambermaid", "Baylor University"),
  Player.new("Ladennifer Jadaniston", "University of Colorado"),
  Player.new("Ladadadaladadadadada Dala-Dadaladaladalada", "University of Arizona"),
  Player.new("Harvard University", "DeVry University"),
  Player.new("Morse Code", "Army Navay Surplus Store"),
  Player.new("Wing Dings", "Online Classes"),
  Player.new("Firstname Lastname", "College University"),
  Player.new("God", "Home schooled"),
  Player.new("Squeeeeeeeeeeps", "Santa Monica College"),
  Player.new("Benedict Cumberbatch", "Oxford University"),
  Player.new("A.A. Ron Balakay", "Morehouse College"),
  # Pro Edition
  Player.new("Prince Amukamara", "University of Nebraska"),
  Player.new("J.R. Junior Juniors Jr.", "Texas Christian University"),
  Player.new("Faux Doadles", "University of Oregon"),
  Player.new("Fozzy Whittaker", "University of Texas"),
  Player.new("Myriad Profiteroles", "Utah University"),
  Player.new("Busters Brownce", "Illinois State University"),
  Player.new("Turdine Cupcake"), # Not sure what his College affiliation is
  Player.new("Rerutweeds Myth", "University of Washington"),
  Player.new("Ishmaa'ily Kitchen", "Kent State University"),
  Player.new("Takittothu' Limit", "College De Cannes"), # Also unsure
  Player.new("Snarf Mintz-Plasse", "East Lost Angeles College"),
  Player.new("Frostee Rucker", "University of Southern California"),
  Player.new("Splendiferous Finch", "Northwestern University"),
  Player.new("Triple Parakeet-Shoes", "Ball State University"),
  Player.new("Logjammer D'Baggagecling", "North Texas University"),
  Player.new("A.A. Ron Rodgers", "University of California")
]

All = East | West

README = File.read(File.join(settings.root, 'README.md'))

set :static_cache_control, [:public]

get '/' do
  erb :readme, locals: {
    east: players(East.sample(1)),
    west: players(West.sample(1)),
    readme: markdown(README)
  }
end

get '/players' do
  players_as_json All
end

get '/player' do
  players_as_json All.sample(n_or_one)
end

get '/east' do
  players_as_json East
end

get '/west' do
  players_as_json West
end

get '/east/player' do
  players_as_json East.sample(n_or_one)
end

get '/west/player' do
  players_as_json West.sample(n_or_one)
end

get '/avatar.png' do
  send_random_player_image All
end

get '/east/avatar.png' do
  send_random_player_image East
end

get '/west/avatar.png' do
  send_random_player_image West
end

get '/:id' do
  content_type :json
  players(All).find(-> { content_type :html; pass }) {|hash| hash[:id] == params[:id] }.to_json
end

def n_or_one
  (params[:n] || 1).to_i
end

def player_with_image(player)
  player.to_h.merge image: url("/images/#{player.id}.png")
end

def players(set)
  set.map {|player| player_with_image(player) }
end

def players_as_json(set)
  content_type :json
  players(set).to_json
end

def send_random_player_image(set)
  cache_control :no_cache, max_age: 5
  send_file File.join(settings.public_folder, "images", "#{set.sample.id}.png"), last_modified: Time.now
end

