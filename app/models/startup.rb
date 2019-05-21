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

  def self.all
    @@all
  end

  def pivot(name, domain)
    @name = name
    @domain = domain
  end

  def self.find_by_founder(founder)
    self.all.find do |startup|
      startup.founder == founder
    end
    #given a string of a founder's name, returns the first startup whose founder's name matches
  end

  def self.domains
    self.all.collect do |startup|
      startup.domain
    end
    #should return an array of all of the different startup domains
  end

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment)
    #given a venture capitalist object, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.
  end

  def funding_rounds
    FundingRound.all.select do |fundinground|
      fundinground.startup == self
    end
    ##LINK###
    #returns an array of all funding rounds for that venture capitalist
    ##do this first###
  end

  def num_funding_rounds
    FundingRound.all.select do |fundinground|
      fundinground.startup == self
    #Returns the total number of funding rounds that the startup has gotten
  end.count
  end

  def total_funds
    total = 0
    funding_rounds.map do |fund|
      total += fund.investment
    end
    total
    #Returns the total sum of investments that the startup has gotten
  end

  def investors
    funding_rounds.map do |investor|
      investor.venture_capitalist
    end.uniq
    #Returns a unique array of all the venture capitalists that have invested in this company
  end

  def big_investors
    investors.select do |big_guys|
      big_guys.total_worth >= 1000000000
    end
    #Returns a unique array of all the venture capitalists that have invested in this company and are in the Trés Commas club
  end

end #end Startup Class
