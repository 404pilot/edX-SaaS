class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    raise NoSuchStrategyError.new("Strategy must be one of R,P,S") unless 
    	player1[1] =~ /[RPS]/ && player2[1] =~ /[RPS]/

    s1 = represent_by_number(player1[1])
    s2 = represent_by_number(player2[1])

    if (s1 - s2 + 3 ) % 3 != 2
    	player1
    else
    	player2
    end
  end

  def self.tournament_winner(tournament)
    # TODO any better way to determine a type in ruby?
    if tournament[0].kind_of?(String)
    	tournament
    else
    	winner(tournament_winner(tournament[0]),tournament_winner(tournament[1]))
    end
  end

  def self.represent_by_number(s)
  	case s
	  	when 'R'
	  		3
	  	when 'S'
	  		2
	  	when 'P'
	  		1
  	end
  end

end