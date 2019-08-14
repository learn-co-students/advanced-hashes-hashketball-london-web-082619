# Write your code here!
require "pry"

def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets", 
      :colors => ["Black", "White"], 
      :players => [{
        :"Alan Anderson" => {
          :number => 0, 
          :shoe => 16,
          :points => 22,
          :rebounds => 12, 
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
         }
      },
       {:"Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12, 
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
         }
       },
       {:"Brook Lopez" => {
          :number => 11, 
          :shoe => 17,
          :points => 17,
          :rebounds => 19, 
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
         }
       },
       {:"Mason Plumlee" => {
          :number => 1, 
          :shoe => 19,
          :points => 26,
          :rebounds => 11, 
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
         }
       },
       {:"Jason Terry" => {
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
     ]
    }, 
    :away => {
      :team_name => "Charlotte Hornets", 
      :colors => ["Turquoise", "Purple"], 
      :players => [{
        :"Jeff Adrien" => {
          :number => 4, 
          :shoe => 18,
          :points => 10,
          :rebounds => 1, 
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        }
      },
        {:"Bismack Biyombo" => {
          :number => 0, 
          :shoe => 16,
          :points => 12,
          :rebounds => 4, 
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
         }
        },
        {:"DeSagna Diop" => {
          :number => 2, 
          :shoe => 14,
          :points => 24,
          :rebounds => 12, 
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
         }
        },
        {:"Ben Gordon" => {
          :number => 8, 
          :shoe => 15,
          :points => 33,
          :rebounds => 3, 
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
         }
        },
        {:"Kemba Walker" => {
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
      ]
    }
  }
hash
end

def num_points_scored (element)
  game_hash.each do |home_vs_away, team|
     team.each do |team_attribute, values|
       if team_attribute == :players
         values.each do |name|
           if name.keys[0].to_s == element
              #binding.pry
             player = name.keys[0]
             return name[player][:points]
         end
        end
       end
    end
  end
end

def shoe_size (element)
  game_hash.each do |home_vs_away, team|
     team.each do |team_attribute, values|
       if team_attribute == :players
         values.each do |name|
         if name.keys[0].to_s == element
           #binding.pry
           return name[name.keys[0]][:shoe] 
         end
        end
       end
    end
  end
end

def team_colors (element)
  game_hash.each do |home_vs_away, team|
    team.each do |team_attribute, values|
      #binding.pry
      if values == element
        key = team.keys[1]
        return team[key]
      end
    end
  end
end

def team_names
  #binding.pry
  home_team = game_hash[:home][:team_name]
  away_team =  game_hash[:away][:team_name]
  home_and_away = [home_team, away_team]
  return home_and_away
end

def player_numbers (element)
  team_numbers = []
  game_hash.each do |home_vs_away, team|
    if team[:team_name] == element
     
     team.each do |team_attribute, values|
       if team_attribute == :players
         values.each do |name|
           name.each do |first_name, name_attributes|
             team_numbers << name_attributes[:number]
              #binding.pry
             end
          end
        end
      end
    end
  end
  team_numbers
end

def player_stats (element)
  game_hash.each do |home_vs_away, team|
   team.each do |team_attribute, values|
      if team_attribute == :players
        values.each do |name|
          name.each do |first_name, name_attributes|
            if first_name.to_s == element
              return name_attributes
            #binding.pry
           end
          end
        end
      end
    end
  end
end

def big_shoe_rebounds 
  biggest_shoe = 0
  biggest_shoe_rebounds = 0
  game_hash.each do |home_vs_away, team|
   team.each do |team_attribute, values|
      if team_attribute == :players
        values.each do |name|
          name.each do |first_name, name_attributes|
            #binding.pry
            if name[name.keys.first][:shoe] > biggest_shoe
              biggest_shoe = name[name.keys.first][:shoe]
              biggest_shoe_rebounds = name[name.keys.first][:rebounds]
            end
          end
        end
      end
    end
  end
  biggest_shoe_rebounds
end
  
def most_points_scored
  most_points = 0
  most_points_scorer = ""
  game_hash.each do |home_vs_away, team|
   team.each do |team_attribute, values|
      if team_attribute == :players
        values.each do |name|
          name.each do |first_name, name_attributes|
            #binding.pry
            if name[name.keys.first][:points] > most_points
              most_points = name[name.keys.first][:points]
              most_points_scorer = name.keys.first.to_s
            end
          end
        end
      end
    end
  end
  most_points_scorer
end

def winning_team
  home_team = game_hash[:home][:team_name]
  away_team = game_hash[:away][:team_name]
  home_points = 0
  away_points = 0 
  game_hash.each do |home_vs_away, team|
    if home_vs_away.to_s == "home"
      team.each do |team_attribute, values|
       if team_attribute == :players
        values.each do |name|
          name.each do |first_name, name_attributes|
            home_points += name[name.keys.first][:points]
            end
          end
        end
      end
    end
    if home_vs_away.to_s == "away"
      team.each do |team_attribute, values|
       if team_attribute == :players
        values.each do |name|
          name.each do |first_name, name_attributes|
            away_points += name[name.keys.first][:points]
          end
        end
      end
    end
   end
  end
  if home_points > away_points
    return home_team
  elsif away_points > home_points
    return away_team
  end
end
  
def player_with_longest_name
  longest_name = ""
  game_hash.each do |home_vs_away, team|
   team.each do |team_attribute, values|
      if team_attribute == :players
        values.each do |name|
          name.each do |first_name, name_attributes|
            if name.keys.first.to_s.length > longest_name.length
              longest_name = name.keys.first.to_s
            end
          end
        end
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  most_steals = 0
  player_most_steals = ""
  game_hash.each do |home_vs_away, team|
   team.each do |team_attribute, values|
      if team_attribute == :players
        values.each do |name|
          name.each do |first_name, name_attributes|
            #binding.pry
            if name[name.keys.first][:steals] > most_steals
              most_steals = name[name.keys.first][:steals]
              player_most_steals = name.keys.first.to_s
            end
          end
        end
      end
    end
  end
  player_most_steals
  if player_with_longest_name == player_most_steals
    return true
  end
end

