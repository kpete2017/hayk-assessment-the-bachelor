require 'pry'

def get_every_contestant data
  data.reduce([]) do |all_contestant, (season, contestant)|
    contestant.each do |contestant_stats|
      all_contestant << contestant_stats
    end
  end
end

def get_season_contestants data, season_search
  season_contestants = data.select do |season, contestants|
    if season == season_search
      return contestants
    end
  end
end

def get_first_name_of_season_winner data, season_search
  season_contestants = get_season_contestants(data, season_search)
  season_contestants.find do |contestant|
    return contestant["name"].split(" ").first if contestant["stats"] = "Winner"
  end
end

def get_contestant_name data, occupation
  data.select do |season_number, contestant|
    contestant.select do |stats|
      return stats["name"] if stats["occupation"] == occupation
    end
  end
end

def count_contestants_by_hometown data, hometown
  home_count = 0
  data.select do |_season_number, contestant|
    contestant.select do |stats|
      if stats["hometown"] === hometown
        home_count += 1
      end
    end
  end
  home_count
end

def get_occupation data, hometown
  data.select do |season_number, contestant|
    contestant.select do |stats|
      return stats["occupation"] if stats["hometown"] === hometown
    end
  end
end

def get_average_age_for_season data, season
  totalAge = 0
  totalContestant = 0
  totalAverage = 0
  data.select do |season_number, contestant|
    if season === season_number
      contestant.select do |stats|
        totalAge += stats["age"].to_f
        totalContestant += 1
      end
    end
  end
  totalAverage = totalAge / totalContestant
  return totalAverage.round
end