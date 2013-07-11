require 'sinatra'
require 'json'
require 'kramdown'

require './lib/player'

East = [
  Player.new("D'Marcus Williums"),
  Player.new("T.J. Juckson"),
  Player.new("T'Variusness King"),
  Player.new("Tyroil Smoochie-Wallace"),
  Player.new("D'Squarius Green, Jr."),
  Player.new("Ibrahim Moizoos"),
  Player.new("Jackmerius Tacktheritrix"),
  Player.new("D'Isiah T. Billings-Clyde"),
  Player.new("D'Jasper Probincrux III"),
  Player.new("Leoz Maxwell Jilliumz"),
  Player.new("Javaris Jamar Javarison-Lamar"),
  Player.new("Davoin Shower-Handel"),
  Player.new("Hingle McCringleberry"),
  Player.new("L'Carpetron Dookmarriot"),
  Player.new("J'Dinkalage Morgoone"),
  Player.new("Xmus Jaxon Flaxon-Waxon")
]

West = [
  Player.new("Saggitariutt Jefferspin"),
  Player.new("D'Glester Hardunkichud"),
  Player.new("Swirvithan L'Goodling-Splatt"),
  Player.new("Quatro Quatro"),
  Player.new("Ozamataz Buckshank"),
  Player.new("Beezer Twelve Washingbeard"),
  Player.new("Shakiraquan T.G.I.F. Carter"),
  Player.new("X-Wing @Aliciousness"),
  Player.new("Sequester Grundelplith M.D."),
  Player.new("Scoish Velociraptor Maloish"),
  Player.new("T.J. A.J. R.J. Backslashinfourth V"),
  Player.new("Eeeee Eeeeeeeee"),
  Player.new("Donkey Teeth"),
  Player.new("Torque (construction noise) Lewith"),
  Player.new("\u2A17 (the player formerly known as Mousecop)"),
  Player.new("Dan Smith", "BYU")
]

All = East | West

set :static_cache_control, [:public]

get '/' do
  erb :readme, locals: {
    east: players(East.sample(1)),
    west: players(West.sample(1)),
    readme: markdown(readme)
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
  players(All).find(-> { pass }) {|hash| hash[:id] == params[:id] }.to_json
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
  players(set).to_json
end

def send_random_player_image(set)
  cache_control :no_cache, max_age: 5
  send_file File.join(settings.public_folder, "images", "#{set.sample.id}.png"), last_modified: Time.now
end

def readme
  File.read(File.join(settings.root, 'README.md'))
end
