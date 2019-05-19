class Startup

  attr_accessor :name
  attr_reader :founder, :domain

  @@all = []

  def initialize(name, founder, domain)
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
    self.all.find {|a| a.founder == founder}
  end

  def self.domains
    self.all.map {|a| a.domain}
  end

  def sign_contract(invester, type, amount)
    FundingRound.new(self, invester, type, amount)
  end

  def find_funding_rounds
    FundingRound.all.select {|a| a.startup == self}
  end

  def num_funding_rounds
    find_funding_rounds.count
  end

  def total_funds
    find_funding_rounds.inject(0) {|sum, a| sum + a.amount}
  end

  def investers
    find_funding_rounds.map {|a| a.venture_capitalist}.uniq
  end

  def big_investors
    investers.select {|a| VentureCapitalist.tres_commas_club.include?(a)}
  end
end
