require "pry"
def game_hash
  {:home => {:team_name => "Brooklyn Nets", :colors => ["Black", "White"], 
  :players => {
  "Alan Anderson"=> {:number => "0", :shoe => 16, :points => 22, :rebounds => "12", :assists => "12", :steals => 3, :blocks => "1", :slam_dunks => "1"},
    "Reggie Evans" => {:number => "30", :shoe => 14, :points => 12, :rebounds => "12", :assists => "12", :steals => 12, :blocks => "12", :slam_dunks => "7" }, 
    "Brook Lopez" => {:number => "11", :shoe => 17, :points => 17, :rebounds => "19", :assists =>"10", :steals => 3, :blocks => "1", :slam_dunks => "15" },
    "Mason Plumlee" => {:number => "1", :shoe => 19, :points =>26, :rebounds => "11", :assists => "6", :steals => 3, :blocks => "8", :slam_dunks => "5" }, 
    "Jason Terry" => {:number => "31", :shoe => 15, :points => 19, :rebounds => "2", :assists => "2", :steals => 4, :blocks => "11", :slam_dunks => "1" }}
    
    },
    :away => {:team_name => "Charlotte Hornets", :colors =>["Turquoise", "Purple"], :players =>
    {"Jeff Adrien" => {:number => "4", :shoe => 18, :points =>10, :rebounds => "1", :assists =>"1", :steals => 2, :blocks => "7", :slam_dunks => "2"},
    "Bismack Biyombo"=> {:number => "0", :shoe => 16, :points =>12, :rebounds => "4", :assists =>"7", :steals => 22, :blocks => "15", :slam_dunks => "10"},
    "DeSagna Diop" => {:number => "2", :shoe => 14, :points => 24, :rebounds => "12", :assists => "12", :steals => 4, :blocks => "5", :slam_dunks => "5"},
    "Ben Gordon" => {:number => "8", :shoe => 15, :points =>33, :rebounds => "3", :assists =>"2", :steals => 1, :blocks => "1", :slam_dunks => "0"},
    "Kemba Walker" =>{:number => "33", :shoe => 15, :points =>6, :rebounds => "12", :assists =>"12", :steals => 7, :blocks => "5", :slam_dunks => "12"}}
  }}
end

#1 iterates over home and team
#2itertaes over players and player names
#3 iterates over player name and its information
# if parameter is equal to player name
# return that player scored points.
def num_points_scored (sportsman)
game_hash
scores = 0
  game_hash.each do |team_position, team_data|
  team_data.each do | player_name, information|
   # binding.pry
  if player_name == :players                  
  information.each do |name, numbers|
    #binding.pry
  if name == sportsman              
  numbers.each do |key, value|
    #binding.pry
  if key == :points
     #binding.pry
  return scores = value.to_i
  #binding.pry
  end
  end
  end
  end
  end
  end
  end 
   #return scores
  end
 
 
 def shoe_size (player_name)
   game_hash.each do |team, atributes|
atributes[:players].each do |member, stats|
if player_name == member
 return stats[:shoe].to_i
end
end
end
end

def team_colors (team)
colores = []
game_hash.each do |key,team_data|
if team_data[:team_name] == team 
colores << team_data[:colors]
end 
end
return colores.flatten
end

def team_names
names = []
game_hash.each do |key,value|
names << value[:team_name]
end
return names
end

def player_numbers(team_name)
jersey_numbers = []
game_hash.each do |home_away,team_data|
team_data[:players].each do |name, information|
  
 if team_data[:team_name] == team_name
jersey_numbers << information[:number].to_i

end
end
end
return jersey_numbers
end

def player_stats (player_name)
players_info = {}
game_hash.each do |home_away, atributes|
atributes[:players].each do |player, stats|
if player == player_name
players_info = stats
end
end
end
return players_info.merge(players_info) { |k, v| Integer(v) rescue v }
end


def big_shoe_rebounds
biggest_rebound = 0
biggest_shoe_size = 0
game_hash.each do |home_away, atributes|
atributes[:players].each do |name, stats|
 if stats[:shoe] > biggest_shoe_size
   biggest_shoe_size = stats[:shoe]
   biggest_rebound = stats[:rebounds]
end
end
end
return biggest_rebound.to_i
end

def most_points_scored
  names = nil
  most_points = 0
  game_hash.each do |home_away, atributes|
    atributes[:players].each do |name, stats|
      if stats[:points] > most_points
        #binding.pry
        most_points = stats[:points]
        names = name
        #binding.pry
  end
end
end
return names
end

def winning_team
  winner = nil
game_hash[:home][:players].each do |players, stats|
game_hash[:away][:players].each do |players_away, stats_away|
  if stats[:points] > stats_away[:points]
    winner = game_hash[:home][:team_name]
  else
    winner = game_hash[:away][:team_name]
  #binding.pry

end
end
end
return winner
end

def player_with_longest_name
  longest_name = nil
  size = 0
  game_hash.each do | home_away, atributes|
    atributes[:players].each do |name, stats|
      #binding.pry
      if name.length > size
        size = name.length
         longest_name = name
        #binding.pry
      end
    end
  end
  return longest_name
end
def long_name_steals_a_ton?
  steals = 0
  unknown_name = ""
   game_hash.each do | home_away, atributes|
    atributes[:players].each do |name, stats|
      if stats[:steals] > steals
        steals = stats[:steals]
        unknown_name = name
         
  end
end
end
unknown_name == player_with_longest_name
end



