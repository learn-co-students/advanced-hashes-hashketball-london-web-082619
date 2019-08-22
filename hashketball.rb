require "pry"

def game_hash
  hash = {
      :home => {
          :team_name => "Brooklyn Nets",
          :colors => ["Black", "White"],
          :players => [
              {:Player_Name => "Alan Anderson",
               :Number => 0,
               :Shoe => 16,
               :Points => 22,
               :Rebounds => 12,
               :Assists => 12,
               :Steals => 3,
               :Blocks => 1,
               :Slam_Dunks => 1
              },

              {:Player_Name => "Reggie Evans",
               :Number => 30,
               :Shoe => 14,
               :Points => 12,
               :Rebounds => 12,
               :Assists => 12,
               :Steals => 12,
               :Blocks => 12,
               :Slam_Dunks => 7
              },

              {:Player_Name => "Brook Lopez",
               :Number => 11,
               :Shoe => 17,
               :Points => 17,
               :Rebounds => 19,
               :Assists => 10,
               :Steals => 3,
               :Blocks => 1,
               :Slam_Dunks => 15
              },

              {:Player_Name => "Mason Plumlee",
               :Number => 1,
               :Shoe => 19,
               :Points => 26,
               :Rebounds => 11,
               :Assists => 6,
               :Steals => 3,
               :Blocks => 8,
               :Slam_Dunks => 5
              },

              {:Player_Name => "Jason Terry",
               :Number => 31,
               :Shoe => 15,
               :Points => 19,
               :Rebounds => 2,
               :Assists => 2,
               :Steals => 4,
               :Blocks => 11,
               :Slam_Dunks => 1
              }
          ]
      },

  :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
          {:Player_Name => "Jeff Adrien",
           :Number => 4,
           :Shoe => 18,
           :Points => 10,
           :Rebounds => 1,
           :Assists => 1,
           :Steals => 2,
           :Blocks => 7,
           :Slam_Dunks => 2
          },

          {:Player_Name => "Bismack Biyombo",
           :Number => 0,
           :Shoe => 16,
           :Points => 12,
           :Rebounds => 4,
           :Assists => 7,
           :Steals => 22,
           :Blocks => 15,
           :Slam_Dunks => 10
          },

          {:Player_Name => "DeSagna Diop",
           :Number => 2,
           :Shoe => 14,
           :Points => 24,
           :Rebounds => 12,
           :Assists => 12,
           :Steals => 4,
           :Blocks => 5,
           :Slam_Dunks => 5
          },

          {:Player_Name => "Ben Gordon",
           :Number => 8,
           :Shoe => 15,
           :Points => 33,
           :Rebounds => 3,
           :Assists => 2,
           :Steals => 1,
           :Blocks => 1,
           :Slam_Dunks => 0
          },

          {:Player_Name => "Kemba Walker",
           :Number => 33,
           :Shoe => 15,
           :Points => 6,
           :Rebounds => 12,
           :Assists => 12,
           :Steals => 7,
           :Blocks => 5,
           :Slam_Dunks => 12
          }
      ]
    }
  }
  hash
end

def num_points_scored(player_name)
  hash = game_hash
  points_scored = 0
  hash.each do |teams, info|
    info[:players].each do |player|
      if player[:Player_Name] == player_name
        return player[:Points]
      else
        next
      end
    end
  end
  nil
end

def shoe_size(player_name)
  hash = game_hash
  hash.each do |teams, info|
    info[:players].each do |player|
      if player[:Player_Name] == player_name
        return player[:Shoe]
      else
        next
      end
    end
  end
  nil
end

def team_colors(team_name)
  hash = game_hash
  hash.each do |teams, info|
    if info[:team_name] == team_name
      return info[:colors]
    end
  end
  nil
end

def team_names
  hash = game_hash
  team_names = []
  hash.each do |teams, info|
    team_names.push(info[:team_name])
  end
  team_names
end


def player_numbers(team_name)
  player_numbers = []
  hash = game_hash
  hash.each do |teams, info|
    if info[:team_name] == team_name
      info[:players].each do |player|
        player_numbers.push(player[:Number])
      end
    end
  end
  player_numbers
end

