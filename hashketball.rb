require "pry"

def game_hash
   {
     :home => {
       team_name: "Brooklyn Nets",
       colors: ["Black", "White"],
       :players => {
         "Alan Anderson" => {
           number: 0,
           shoe: 16,
           points: 22,
           rebounds: 12,
           assists: 12,
           steals: 3,
           blocks: 1,
           slam_dunks: 1
         },
         "Reggie Evans" => {
           number: 30,
           shoe: 14,
           points: 12,
           rebounds: 12,
           assists: 12,
           steals: 12,
           blocks: 12,
           slam_dunks: 7
         },
         "Brook Lopez" => {
           number: 11,
           shoe: 17,
           points: 17,
           rebounds: 19,
           assists: 10,
           steals: 3,
           blocks: 1,
           slam_dunks: 15
         },
         "Mason Plumlee" => {
           number: 1,
           shoe: 19,
           points: 26,
           rebounds: 11,
           assists: 6,
           steals: 3,
           blocks: 8,
           slam_dunks: 5
         },
         "Jason Terry" => {
           number: 31,
           shoe: 15,
           points: 19,
           rebounds: 2,
           assists: 2,
           steals: 4,
           blocks: 11,
           slam_dunks: 1
         }
       }
     },
     :away => {
       team_name: "Charlotte Hornets",
       colors: ["Turquoise", "Purple"],
       :players => {
         "Jeff Adrien" => {
           number: 4,
           shoe: 18,
           points: 10,
           rebounds: 1,
           assists: 1,
           steals: 2,
           blocks: 7,
           slam_dunks: 2
         },
         "Bismack Biyombo" => {
           number: 0,
           shoe: 16,
           points: 12,
           rebounds: 4,
           assists: 7,
           steals: 22,
           blocks: 15,
           slam_dunks: 10
         },
         "DeSagna Diop" => {
           number: 2,
           shoe: 14,
           points: 24,
           rebounds: 12,
           assists: 12,
           steals: 4,
           blocks: 5,
           slam_dunks: 5
         },
         "Ben Gordon" => {
           number: 8,
           shoe: 15,
           points: 33,
           rebounds: 3,
           assists: 2,
           steals: 1,
           blocks: 1,
           slam_dunks: 0
         },
         "Kemba Walker" => {
           number: 33,
           shoe: 15,
           points: 6,
           rebounds: 12,
           assists: 12,
           steals: 7,
           blocks: 5,
           slam_dunks: 12
         }
       }
     }
   }
 end
 

def num_points_scored(player)
  game_hash.each do |team_key, team_hash|
    team_hash[:players].each do |key, value|
      if key == player
        return value[:points]
      end
    end 
  end
end

def shoe_size(player)
  game_hash.each do |team_key, team_hash|
    team_hash[:players].each do |key, value|
      if key == player
        return value[:shoe]
      end
    end 
  end
end

def team_colors(team)
  game_hash.each do |team_key, team_hash|
    if team_hash[:team_name] == team
      return team_hash[:colors]
    end
  end
end

def team_names
  game_hash.map do |team_key, team_hash|
    team_hash[:team_name]
  end
end

def player_numbers(team_name)
	  jersey_numbers = []
	  game_hash.each do |team_key, team_hash|
	    if team_hash[:team_name] == team_name
	      team_hash.each do |key, value|
	        if key == :players
	          value.each do |player, stats|
	            jersey_numbers << stats[:number]
	          end
	        end
	      end
	    end
	  end
	  jersey_numbers
	end

 def player_stats(player_name)
	  game_hash.each do |team_key, team_hash|
	    team_hash.each do |attribute, data|
	     if attribute == :players
	       data.each do |player, stats|
	        if player == player_name
	          return stats
	        end
	       end
	      end
	    end
	  end
	end

def big_shoe_rebounds
  shoe = 0
  rebounds = 0
  game_hash.each do |team_key, team_hash|
    team_hash[:players].each do |key, value|
      if value[:shoe] > shoe
        shoe = value[:shoe]
        rebounds = value[:rebounds]
      else
        next
      end
    end
  end
  rebounds
end


def most_points_scored
  points = 0
  high_scorer = []
  game_hash.each do |team_key, team_hash|
    team_hash[:players].each do |key, value|
      if value[:points] > points
        points = value[:points]
        high_scorer = key
      else
        next
      end
    end
  end
  high_scorer
end

def winning_team
	  home_points = 0
	  away_points = 0
	  game_hash.each do |location, team|
	    if location == :home
	      team.each do |attribute, data|
	        if attribute == :players
	          data.each do |player, stats|
	            home_points += stats[:points]
	          end
	        end
	      end
	    else
	      team.each do |attribute, data|
	        if attribute == :players
	          data.each do |player, stats|
	            away_points += stats[:points]
	          end
	        end
	      end
	    end
	  end
	  if home_points > away_points
	    return game_hash[:home][:team_name]
	  else
	    return game_hash[:away][:team_name]
	  end
	end

def player_with_longest_name
	  longest_name_length = 0
	  player_with_longest_name = "player"
	  game_hash.each do |location, team|
	    team.each do |attribute, data|
	      if attribute == :players
	        data.each do |player, stats|
	          if player.length > longest_name_length
	            longest_name_length = player.length
	            player_with_longest_name = player
	          end
	        end
	      end
	    end
	  end
	  player_with_longest_name
	end
	
	 def long_name_steals_a_ton?
	  best_steals = 0
	  player_with_best_steals = "player"
	  game_hash.each do |location, team|
	    team.each do |attribute, data|
	      if attribute == :players
	        data.each do |player, stats|
	          if stats[:steals] > best_steals
	            best_steals = stats[:steals]
	            player_with_best_steals = player
	          end
	        end
	      end
	    end
	  end
	  if player_with_best_steals == player_with_longest_name
	    return true
	  end
	end  
      
    
    
    