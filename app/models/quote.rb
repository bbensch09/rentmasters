class Quote < ActiveRecord::Base

belongs_to :market_rent

validates  :first_name, :last_name, :email, :neighborhood, :bedrooms, :condition, :current_rent,
  presence: true

attr_accessor :estimate, :low_range, :high_range, :condition_multiplier
attr_reader :raw_market_avg, :error_message

  def get_range
    get_estimate
    @error_message = "Unfortunately we have insufficient market data to provide a reliable estimate for your apartment. Please contact us at rentmasters.sf@gmail.com for more information."
    return @error_message if self.estimate.nil? || self.estimate < 0
    low_range
    high_range
    return " "    
  end

  def get_estimate
      # self.estimate = MarketRent.where(neighborhood: self.neighborhood, bedrooms: self.bedrooms).average(:market_rent)
      get_condition
      raw_market_rent = MarketRent.where(neighborhood: self.neighborhood, bedrooms: self.bedrooms).average(:market_rent)
      return @error_message if raw_market_rent.nil?
      market_rent_adjusted = raw_market_rent * @condition_multiplier
      market_annual = market_rent_adjusted * 12
      current_annual = self.current_rent * 12
      cash_flow_delta = (market_annual - current_annual)*1.5
      self.estimate = cash_flow_delta.to_i / 1000 * 1000
  end

  def low_range
    return "" if self.estimate.nil?
    self.low_range = ((self.estimate * 0.75) / 1000 * 1000).round(0)
  end

  def high_range
    return "" if self.estimate.nil?
    self.high_range = ((self.estimate * 1.25) / 1000 * 1000).round(0)
  end

  def get_condition
    case self.condition
    when 'On-par with a typical SF apartment'
      @condition_multiplier =  1
    when 'Much nicer than average (looks/feels recently renovated)'
      @condition_multiplier = 1.1
    when 'Worse condition than average (mold, broken appliances, etc.)'
      @condition_multiplier = 0.9
    else @condition_multiplier = 1
    end
  end

  def self.condition_options
    @condition_options = ['On-par with a typical SF apartment','Much nicer than average (looks/feels recently renovated)','Worse condition than average (mold, broken appliances, etc.)']
  end

end


