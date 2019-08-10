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

  def pivot(new_domain, new_name)
    self.domain = new_domain
    self.name = new_name
  end

  def self.all
    @@all
  end

  def self.find_by_founder(founder)
    self.all.find {|startup| startup.founder == founder}
  end

  def self.domains
    domains = []
    self.all.each do |startup|
      domains << startup.domain
    end
    domains.uniq
  end

  def sign_contract(venturecapitalist, type, investment)
    FundingRound.new(self, venturecapitalist, type, investment)
  end

  def num_funding_rounds
    FundingRound.all.select {|round| round.startup == self}.count
  end

  def all_rounds
    FundingRound.all.select {|round| round.startup == self}
  end

  def total_funds
    total = 0
    all_rounds.each {|round| total += round.investment}
    total
  end

  def investors
    funds = []
    all_rounds.each {|round| funds << round.venturecapitalist}
    funds.uniq
  end

  def big_investors
    investors.select {|investor| investor.total_worth > 1000000000}
  end
end
