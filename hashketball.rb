require "pry"

def game_hash
  teams = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        { name: "Alan Anderson", number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1 },
        { name: "Reggie Evans", number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7 },
        { name: "Brook Lopez", number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15 },
        { name: "Mason Plumlee", number: 1, shoe: 19, points: 26, rebounds: 11, assists: 6, steals: 3, blocks: 8, slam_dunks: 5 },
        { name: "Jason Terry", number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1 }
        ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        { name: "Jeff Adrien", number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2 },
        { name: "Bismack Biyombo", number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 22, blocks: 15, slam_dunks: 10 },
        { name: "DeSagna Diop", number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5 },
        { name: "Ben Gordon", number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0 },
        { name: "Kemba Walker", number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 7, blocks: 5, slam_dunks: 12 },
        ]
    }
  }
end

def num_points_scored(name)
  game_hash.each_pair do | team, data |
    data[:players].each do | player |
      return player[:points] if player[:name] == name
    end
  end
end

def shoe_size(name)
  game_hash.each_pair do | team, data |
    data[:players].each do | player |
      return player[:shoe] if player[:name] == name
    end
  end
end
  
def team_colors(team_name)
  game_hash.each_pair do | team, data |
    return data[:colors] if data[:team_name] == team_name
  end
end

def team_names
  game_hash.collect { | team, data | data[:team_name] }
end

def player_numbers(team_name)
  numbers = []
  game_hash.each_pair do | team, data |
    if data[:team_name] == team_name
      data[:players].each do | player |
        numbers << player[:number]
      end
    end
  end
  numbers
end

def player_stats(player_name)
  game_hash.each_pair do | team, data |
    data[:players].each do | player |
      if player[:name] == player_name
        return player.reject { | k, v | k == :name }
      end
    end
  end
end
        

def big_shoe_rebounds
  biggest_shoe = 0
  most_rebounds = 0
  
  game_hash.each_pair do | team, data |
    data[:players].each do | player |
      if player[:shoe] > biggest_shoe
        biggest_shoe = player[:shoe]
        most_rebounds = player[:rebounds]
      end
    end
  end
  most_rebounds
end
    
def most_points_scored
  most_points = 0 
  scoring_player = nil
  
  game_hash.each_pair do | team, data |
    data[:players].each do | player |
      if player[:points] > most_points
        most_points = player[:points]
        scoring_player = player[:name]
      end
    end
  end
  
  scoring_player
end

#Resuable method to calculate the point total of any team
def point_calculator(team)
  game_hash[team][:players].reduce(0) { | memo, player |
    memo += player[:points]
  }
end

def winning_team
  scoreboard = {
    game_hash[:home][:team_name] => point_calculator(:home),
    game_hash[:away][:team_name] => point_calculator(:away)
  }
  
  scoreboard.max_by { | k, v | v }.first
end

def player_with_longest_name
  max_name_length = 0
  player_with_name = nil
    
  game_hash.each_pair do | team, data |
    data[:players].each do | player |
      length = player[:name].length
      if length > max_name_length
        max_name_length = length
        player_with_name = player[:name]
      end
    end
  end
  
  player_with_name
end

def long_name_steals_a_ton?
  steals_to_beat = player_stats(player_with_longest_name)[:steals]
  
  game_hash.each_pair do | team, data |
    data[:players].each do | player |
      return false if player[:steals] > steals_to_beat
    end
  end
  
  true 
end
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  