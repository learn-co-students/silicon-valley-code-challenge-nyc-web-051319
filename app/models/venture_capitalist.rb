class VentureCapitalist
  attr_accessor :name,  :total_worth

  @@all = []


  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
  end

  def self.all
    @@all
  end

  def self.tres_comas_club
    self.all.select do |venture_capitalist|
      venture_capitalist.total_worth > 1000000000
    end
  end

  def offer_contract(startup,type,investment)
    FundingRound.new(startup,self,type,investment)
  end

  def funding_rounds
    FundingRound.select do |funding_round|
      funding_round.venture_capitalist == self
    end
  end

  def portfolio
    funding_rounds.map do |funding_round|
      funding_round.startup
    end.uniq
  end

  def biggest_investment
    funding_rounds.max_by |funding_round|
    funding_round.investment
  end

  def invested(domain)
    total = 0
    funding_rounds.map do |funding_round|
      funding_round.startup.domain == domain
      total =+ fundin_round.investment
    end
    total
  end 


end
