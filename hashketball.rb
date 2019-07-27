require 'pry'

def game_hash
  has_out = {}
  has_out[:home] = {team_name: 'Brooklyn Nets' ,colors: ['Black', 'White'], players:[
  {player_name: "Alan Anderson", number:0 ,shoe: 16,points: 22,rebounds:12 ,assists:12, steals:3 , blocks:1 ,slam_dunks:1 },
  {player_name: "Reggie Evans" ,number: 30,shoe: 14,points: 12,rebounds:12 ,assists:12, steals:12 , blocks:12 ,slam_dunks:7},
  {player_name: "Brook Lopez",number:11 ,shoe: 17,points: 17,rebounds:19 ,assists:10, steals:3 , blocks:1 ,slam_dunks: 15},
  {player_name: "Mason Plumlee",number:1 ,shoe: 19,points: 26,rebounds:11 ,assists:6, steals: 3, blocks:8,slam_dunks:5 },
  {player_name: "Jason Terry",number:31 ,shoe: 15,points: 19,rebounds:2 ,assists:2, steals: 4, blocks:11,slam_dunks:1}]}
  has_out[:away] = {team_name: 'Charlotte Hornets' ,colors: ['Turquoise', 'Purple'], players: [
  {player_name: "Jeff Adrien", number:4 ,shoe:18 ,points:10 ,rebounds:1, assists:1, steals:2 , blocks:7 ,slam_dunks:2},
  {player_name:"Bismack Biyombo" ,number:0,shoe:16 ,points:12 ,rebounds:4, assists:7, steals:22 , blocks:15 ,slam_dunks:10  },
  {player_name:"DeSagna Diop" ,number:2 ,shoe:14 ,points:24 ,rebounds:12, assists:12, steals:4 , blocks:5 ,slam_dunks:5  },
  {player_name:"Ben Gordon" ,number:8 ,shoe:15 ,points:33 ,rebounds:3, assists:2, steals:1 , blocks:1 ,slam_dunks:0  },
  {player_name:"Kemba Walker" ,number:33 ,shoe:15 ,points:6 ,rebounds:12, assists:12, steals:7 , blocks:5 ,slam_dunks:12  }]}
  return has_out
end

def num_points_scored (name)
  for i in game_hash[:home][:players]
    if i[:player_name].include?(name) 
      return i[:points]
    end  
  for i in game_hash[:away][:players]
    if i[:player_name].include?(name) 
      return i[:points]
    end
    end  
  end
end

def shoe_size (name)
  for i in game_hash[:home][:players]
    if i[:player_name].include?(name) 
      return i[:shoe]
    end  
  for i in game_hash[:away][:players]
    if i[:player_name].include?(name) 
      return i[:shoe]
    end
    end  
  end
end

def team_colors (name)
  if game_hash[:home][:team_name] == name
    return game_hash[:home][:colors].to_a
  end
  if game_hash[:away][:team_name] == name
    return game_hash[:away][:colors].to_a
  end
end

def team_names
  out_array = []
  for i,j in game_hash
    out_array.append(game_hash[i][:team_name])
  end
  return out_array
end

def player_numbers (team_name)
  out_array = []
  if team_name == "Brooklyn Nets"
    for i in game_hash[:home][:players]
      out_array.append(i[:number])
    end
  end

  if team_name == "Charlotte Hornets"
    for i in game_hash[:away][:players]
      out_array.append(i[:number])
    end
  end
  return out_array.sort_by(&:to_i)
end


def player_stats (name)
  for i in game_hash[:home][:players]
    if i[:player_name].include?(name) 
      return i.tap { |hs| hs.delete(:player_name) }
    end  
  for i in game_hash[:away][:players]
    if i[:player_name].include?(name) 
      return i.tap { |hs| hs.delete(:player_name) }
    end
    end  
  end
end

def winning_team
  home = 0
  away = 0 
  for i in game_hash[:home][:players]
    home += i[:points]
  end
  for i in game_hash[:away][:players]
    away += i[:points]
  end
  if home >away
    return 'Brooklyn Nets'
  else
    return 'Charlotte Hornets'
  end
end

def player_with_longest_name
  name_size = 0
  for j in [:home,:away ]
      for i in game_hash[j][:players]
        if i[:player_name].size>= name_size
        out = i[:player_name]
          name_size= i[:player_name].size
        end
      end
  end
  return out
end

def long_name_steals_a_ton?
  for i in game_hash[:away][:players]
    if i[:player_name] == player_with_longest_name
      steals_comp = i[:steals]
    end
  end
      out = true
  for j in [:home,:away ]
      for i in game_hash[j][:players]
        if i[:steals]> steals_comp
          out = false
          p i 
        end
      end
  end
  return out
end


def big_shoe_rebounds
  shoe_size = 0
    out = []
    for j in [:home,:away ]
      for i in game_hash[j][:players]
        if i[:shoe]>= shoe_size
        out = i[:rebounds]
          shoe_size= i[:shoe]
        end
      end
  end
  return out
end

def most_points_scored
  shoe_size = 0
    out = []
    for j in [:home,:away ]
      for i in game_hash[j][:players]
        if i[:points]>= shoe_size
          out = i[:player_name]
          shoe_size = i[:points]
        end
      end
  end
  return out
end

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
    team_data.each do |attribute, data|
      #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
      binding.pry
 
      #what is 'data' at each loop throughout .each block? when will the following line of code work and when will it break?
      data.each do |data_item|
          binding.pry
      end
    end
  end
end

