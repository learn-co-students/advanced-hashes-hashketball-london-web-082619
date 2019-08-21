require "pry"

def game_hash
  {
        home: { 
            team_name: 'Brooklyn Nets',
            colors: ['Black', 'White'],
            players: [
              { player_name: 'Alan Anderson',
                number: 0,
                shoe: 16,
                points: 22,
                rebounds: 12,
                assists: 12,
                steals: 3,
                blocks: 1,
                slam_dunks: 1 },
              { player_name: 'Reggie Evans',
                number: 30,
                shoe: 14,
                points: 12,
                rebounds: 12,
                assists: 12,
                steals: 12,
                blocks: 12,
                slam_dunks: 7 },
              { player_name: 'Brook Lopez',
                number: 11,
                shoe: 17,
                points: 17,
                rebounds: 19,
                assists: 10,
                steals: 3,
                blocks: 1,
                slam_dunks: 15 },
              { player_name: 'Mason Plumlee',
                number: 1,
                shoe: 19,
                points: 26,
                rebounds: 11,
                assists: 6,
                steals: 3,
                blocks: 8,
                slam_dunks: 5 },
              { player_name: 'Jason Terry',
                number: 31,
                shoe: 15,
                points: 19,
                rebounds: 2,
                assists: 2,
                steals: 4,
                blocks: 11,
                slam_dunks: 1 }
            ] },

      
      
      
         away: { 
            team_name: 'Charlotte Hornets',
            colors: ['Turquoise', 'Purple'],
            players: [
              { player_name: 'Jeff Adrien',
                number: 4,
                shoe: 18,
                points: 10,
                rebounds: 1,
                assists: 1,
                steals: 2,
                blocks: 7,
                slam_dunks: 2 },
              { player_name: 'Bismack Biyombo',
                number: 0,
                shoe: 16,
                points: 12,
                rebounds: 4,
                assists: 7,
                steals: 22,
                blocks: 15,
                slam_dunks: 10 },
              { player_name: 'DeSagna Diop',
                number: 2,
                shoe: 14,
                points: 24,
                rebounds: 12,
                assists: 12,
                steals: 4,
                blocks: 5,
                slam_dunks: 5 },
              { player_name: 'Ben Gordon',
                number: 8,
                shoe: 15,
                points: 33,
                rebounds: 3,
                assists: 2,
                steals: 1,
                blocks: 1,
                slam_dunks: 0 },
              { player_name: 'Kemba Walker',
                number: 33,
                shoe: 15,
                points: 6,
                rebounds: 12,
                assists: 12,
                steals: 7,
                blocks: 5,
                slam_dunks: 12 }
            ] }
  }
end






def num_points_scored(pl_name)
  game_hash.each do |home_or_away, team_data|
    team_data.each do |attributes, attribute_data|
     if attributes == :players
         attribute_data.each do |individual_player|
          return individual_player[:points] if individual_player[:player_name] == pl_name
         end
     end
   end
 end
end






def shoe_size(pl_name)
  game_hash.each do |home_or_away, team_data|
    team_data.each do |attributes, attribute_data|
     if attributes == :players
         attribute_data.each do |individual_player|
           return individual_player[:shoe] if individual_player[:player_name] == pl_name
         end
     end
    end
  end
end






def team_colors(team_name)
  game_hash.each do |home_or_away, team_data|
    return team_data[:colors] if team_data[:team_name] == team_name
  end
end







def team_names
  game_hash.collect do |home_or_away, team_data|
    team_data[:team_name]
  end
end
#######Like .each, the collect method will yield each member of an Array to the block. But unlike .each (which just returns the original Array), .collect will collect the results in a new array and return that instead.
#######







def player_numbers(wanted_team_name)
  shirt_numbers = []
  game_hash.each do |home_or_away,team_data|
    if team_data[:team_name] == wanted_team_name
      team_data.each do |attributes, attribute_data|
        if attributes == :players
          attribute_data.each do |individual_player_data|
            shirt_numbers << individual_player_data[:number]
          end
        end
      end
    end
  end
  shirt_numbers
end







def player_stats(pl_name)
  player_stat_hash = {}
  game_hash.each do |home_or_away, team_data|
    team_data.each do |attributes, attribute_data|
      if attributes == :players 
        attribute_data.each do |player|
          if player[:player_name] == pl_name
            player_stat_hash = player
          end
        end
      end
    end
  end
  player_stat_hash.delete_if {|keys|keys == :player_name}
  player_stat_hash
end
          


def big_shoe_rebounds
  biggest_shoe = 0
  number_of_rebounds = 0

  game_hash.each do |home_or_away, team_data|
    team_data[:players].each do |player|
      if player[:shoe] > biggest_shoe
        biggest_shoe = player[:shoe]
        number_of_rebounds = player[:rebounds]
      end
    end
  end

  number_of_rebounds
end



def most_points_scored
  starting_points = 0 
  top_scorer = ""
  game_hash.each do |home_or_away, team_data|
    team_data.each do |attributes, attribute_data|
      if attributes == :players
        attribute_data.each do |individual_player|
          if individual_player[:points] > starting_points
            starting_points = individual_player[:points]
            top_scorer = individual_player[:player_name]
          end
        end
      end
    end
  end
  top_scorer
end


def good_practices
  game_hash.each do |home_or_away, team_data|
    #are you ABSOLUTELY SURE what 'home_or_away and team_data' are? use binding.pry to find out!
    binding.pry
    team.each do |attributes, attribute_data|
      #are you ABSOLUTELY SURE what 'attributes' and 'attribute_data' are? use binding.pry to find out!
      binding.pry
 
      #what is 'attribute_data' at each loop throughout .each block? when will the following line of code work and when will it break?
      attribute_data.each do |individual_player|
          binding.pry
      end
    end
  end
end





