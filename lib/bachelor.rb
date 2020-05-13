require 'pry'
def get_first_name_of_season_winner(data, season)
  data.collect do |season_number, contestant|
    if season_number === season
      contestant.collect do |stats|
        return stats["name"].split(" ")[0] if stats["status"] == "Winner"
      end
    end
  end
end

def get_contestant_name(data, occupation)
  data.collect do |season_number, contestant|
    contestant.collect do |stats|
      return stats["name"] if stats["occupation"] == occupation
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  home_count = 0
  data.collect do |season_number, contestant|
    contestant.collect do |stats|
      if stats["hometown"] === hometown
        home_count += 1
      end
    end
  end
  home_count
end

def get_occupation(data, hometown)
  data.collect do |season_number, contestant|
    contestant.collect do |stats|
      return stats["occupation"] if stats["hometown"] === hometown
    end
  end
end

def get_average_age_for_season(data, season)
  totalAge = 0
  totalContestant = 0
  totalAverage = 0
  data.collect do |season_number, contestant|
    if season === season_number
      contestant.collect do |stats|
        totalAge += stats["age"].to_f
        totalContestant += 1
    end
  end
  end
  totalAverage = totalAge / totalContestant
  return totalAverage.round
end