class Quote < ActiveRecord::Base

belongs_to :market_rent

validates  :first_name, :last_name, :email, :neighborhood, :bedrooms, :condition, :current_rent,
  presence: true

attr_accessor :estimate, :low_range, :high_range
attr_reader :raw_market_avg, :error_message


  def estimate
    @error_message = "Unfortunately we have insufficient market data to provide a reliable estimate for your apartment. Please contact us at rentmasters.sf@gmail.com for more information."
      # self.estimate = MarketRent.where(neighborhood: self.neighborhood, bedrooms: self.bedrooms).average(:market_rent)
      @raw_market_avg = MarketRent.where(neighborhood: self.neighborhood, bedrooms: self.bedrooms).average(:market_rent)
      return @error_message if raw_market_avg.nil? || raw_market_avg < 0
      market_condition_adjusted = raw_market_avg #need to configure this to use inputs
      market_annual = market_condition_adjusted * 12
      current_annual = self.current_rent * 12
      cash_flow_delta2 = (market_annual - current_annual)*2
      self.estimate = cash_flow_delta2.to_i / 1000 * 1000
  end

  def low_range
        return @error_message if @raw_market_avg.nil?
        self.low_range = (self.estimate * 0.75) / 1000 * 1000
  end

  def high_range

        return @error_message if @raw_market_avg.nil?
        self.high_range = (self.estimate * 1.25) / 1000 * 1000
  end

def self.bathroom_options
  @bathroom_options = ['limited bathrooms (i.e. 1 bath for 4 people)',
'normal number of bathrooms',
'extra bathrooms (i.e. a 3bd/2ba)']
end

def self.condition_options
  @condition_options = ['On-par with a typical SF apartment.','Much nicer than a typical apartment (new appliance, looks/feels recently renovated).','Worse condition than a typical SF apartment (moldy bathrooms, old/broken appliances, needs lots of repairs).']
end

end


