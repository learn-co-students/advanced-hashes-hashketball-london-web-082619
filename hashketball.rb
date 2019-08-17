require 'pry'
def game_hash

hash = {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => {
      "Alan Anderson" => {
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      },
      "Reggie Evans" => {
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },
      "Brook Lopez" => {
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      },
      "Mason Plumlee" => {
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },
      "Jason Terry" => {
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
      }
    }
  },
  :away => {:team_name => "Charlotte Hornets",
    :colors => ["Purple","Turquoise"],
    :players => {
      "Jeff Adrien" => {
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      },
      "Bismack Biyombo" => {
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10
      },
      "DeSagna Diop" => {
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      },
      "Ben Gordon" => {
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },
      "Kemba Walker" => {
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12
      }
     }
    }
   }
end

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
    # binding.pry
  if key == :points
  return scores = value
  end
  end
  end
  end
  end
  end
end
end

def shoe_size (foot)
  shoe_sizett = 0
  game_hash.each do | team_position,team_data|
    team_data.each do |player_name, player_size|
      if player_name == :players
        player_size.each do |name, numbers|
          if name == foot
            numbers.each do |key, value|
              if key == :shoe 
               return shoe_sizett = value
              

    
                end
             end
            end    
          end
        end
      end
  end
end


def team_colors(team)
    game_hash.each do |team_position,team_data|
    #team_position is key and results home and away . team_data is value of home and away values
    team_data.each do |team_color, team_goal|
      # team_color is iterating over key colors and value is team_goal is color of the jersey
     
       if team_goal == team
         #so we are comparing team_goal which is team name and the argument team which is also team name.

      return game_hash[team_position][:colors]
      # we are returning the main hash game_hash[team_position which is home and away here] then the colors.
         
      
          end
        end
       end
    end
    
    
    def team_names
       arr = []
       game_hash.each do |team_position,team_data|
        #teamposition = home and away team. team_data = value of home and away
      team_data.each do |team,name|
        #team = is the key team name and name is the value of the team name which is Brooklyn nets or Charlotte hornets.
        if team == :team_name
          arr.push(name)
        #team = :teamname and name = teamname in strings.
        
       end
     end
   end
    arr
 
  end
  
  #iterate over the main hashes and then dig one step in and then another step to get to players numbers. once you there just match the variable to the key to get results. push it into a new array .  
  
  def player_numbers(array)
    place_holder = []
    game_hash.each do |team_position,team_data|
       #teamposition = home and away team. team_data = value of home and away
       if team_data[:team_name] == array
         #we are accessing team name directly from team data. 
         team_data[:players].each do |player_name,player_data|
           #again we are accessing team data to find players 
          place_holder << player_data[:number]
          #putting the place holder and pushign the number inside of player data.

         end
      end
    end
      place_holder
    end
  
  def player_stats(stats)
    game_hash.each do |team_position,team_data|
      team_data[:players].each do |key,value|
        #had to reiterate because i could not get exact value. 
      if key == stats 
        return value
  end
 end 
end
end
    
  #player with the biggest shoe size and biggest rebound.  
def big_shoe_rebounds
rebound = 0 
shoe = 0 
  game_hash.each do |team_position, team_data|
    team_data[:players].each do |key,value|
    value.each do |k,v|
      if k == :shoe #when key matches the loop below will trigger. 
        if v > shoe #checks the value of each shoe
          shoe = v #max value of the shoe is assigned
          rebound = team_data[:players][key][:rebounds]
        #rebound is corresponding with the value of the shoe and it is assigned with the player with highest shoe size and rebounds.
    

          end
        end
      end
    end
   end
  rebound
 end 
 
 def most_points_scored
   most_points = 0 
   top_point_scorer = " "
   game_hash.each do |team_position, team_data|
     team_data[:players].each do |k,v|
     if v[:points] > most_points
       most_points = v[:points]
       top_point_scorer = k
       
      # binding.pry
      end
    end
  end
 
 top_point_scorer
 end 
 
 
 def winning_team
    home_points = 0 
    away_points = 0
   game_hash.each do |team_position, team_data|
     #binding.pry
     if team_position == :home 
       team_data[:players].each do |k,v|
      home_points += v[:points] 
     end
       elsif
       team_position == :away
       team_data[:players].each do |k,v|
         away_points += v[:points]
   
 end
 end
 end
 #i need more points than them to win
 if home_points > away_points 
return game_hash[:home][:team_name]
else 
   away_points > home_points
return game_hash[:away][:team_name]
 end
 end
 
 def player_with_longest_name
   longest_name = ""
   game_hash.each do |team_position,team_data|
     if team_position == :away
       team_data[:players].each do |k,v| 
           players_name = k
           if players_name.size > longest_name.size
             longest_name = players_name
         
          #binding.pry
      end 
     end
   end
  end
longest_name
 end
 
 def most_stealer
   most_steals = 0 
   top_point_scorer = " "
   game_hash.each do |team_position, team_data|
     team_data[:players].each do |k,v|
     if v[:steals] > most_steals
       most_steals = v[:steals]
       top_point_scorer = k
       
      # binding.pry
      end
    end
  end
 
 top_point_scorer

 end 
 
 
 
 def long_name_steals_a_ton?
   most_stealer == player_with_longest_name
end

 
     