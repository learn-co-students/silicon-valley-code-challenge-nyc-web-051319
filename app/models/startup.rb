class Startup

  attr_accessor :name
  attr_reader :founder, :domain

  @@all = []

  def initialize(name, founder,domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def pivot(name, domain)
    @name = name
    @domain = domain
  end

  def self.all
    @@all
  end

  def self.find_by_founder(founder)
    self.all.find do |startup|
      startup.founder == founder
    end
  end

  def self.domains
    self.all.map do |startup|
      startup.domain
    end
  end

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment)
  end

  def num_funding_rounds
    funding_rounds = FundingRound.all.select do |round|
      round.startup == self
    end
    funding_rounds.count
  end

  def total_funds
    rounds = FundingRound.all.select do |round|
      round.startup == self
    end
    investments = rounds.map do |round|
      round.investment
    end
    investments.sum
  end

  def investors
    rounds = FundingRound.all.select do |round|
      round.startup == self
    end
    investors = rounds.map do |round|
      round.venture_capitalist
    end
    investors.uniq
  end

  def big_investors
    venture_capitalists = self.investors
    big_vcs = []
    venture_capitalists.map do |vc|
      VentureCapitalist.tres_commas_club.map do |tcc|
        if tcc == vc
          big_vcs << vc
        end
      end
    end
    big_vcs.uniq
  end

end
