class Startup

  attr_accessor :name
  attr_reader :founder_name, :domain

  @all = []

  def initialize(name, founder_name, domain)
    @name = name
    @founder_name = founder_name
    @domain = domain

    @@all << self
  end

  def self.all
    @@all
  end

  def pivot(domain,name)
    @domain = domain
    @name = name
  end

  def funding_rounds
    FundingRound.all.select do |funding_round|
      funding_round.startup == self
    end
  end


  def self.find_by_founder(founder_name)
    self.all.find do |startup|
      startup.founder_name == founder_name
    end
  end

  def self.domains
    self.all.map do |startup|
      startup.domain
    end
  end

  def sign_contract(venture_capitalist,type,investment)
    FundingRound.new(self,venture_capitalist,type,investment)
  end

  def num_funding_rounds
    funding_rounds.map do |funding_round|
      funding_round.investment == self
    end.count

    def total_funds
      total = 0
      funding_rounds.map do |funding_round|
        total += funding_round.investment
      end
      total
    end

    def investors
      funding_round.map do |funding_round|
        funding_round.venture_capitalist
      end.uniq
    end

    def big_investors
      investors.slect do |investor|
        investor.total_worth > 1000000000
      end
    end 

end
