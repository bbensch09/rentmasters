class Quote < ActiveRecord::Base

belongs_to :market_rent

validates  :first_name, :last_name, :email, :neighborhood, :bedrooms, :bathrooms, :condition, :current_rent,
  presence: true

attr_accessor :estimate, :low_estimate, :high_estimate, :key

  def estimate
      # self.estimate = MarketRent.where(neighborhood: self.neighborhood, bedrooms: self.bedrooms).average(:market_rent)
      raw_market_avg = MarketRent.where(neighborhood: self.neighborhood, bedrooms: self.bedrooms).average(:market_rent)
      market_condition_adjusted = raw_market_avg #need to configure this to use inputs
      market_annual = market_condition_adjusted * 12
      current_annual = self.current_rent * 12
      cash_flow_delta2 = (market_annual - current_annual)*2
      self.estimate = cash_flow_delta2.to_i / 1000 * 1000

  end

  def low_estimate
        self.low_estimate = (self.estimate * 0.75) / 1000 * 1000
  end

  def high_estimate
        self.high_estimate = (self.estimate * 1.25) / 1000 * 1000
  end

  # def key
  #   self.key = "#{neighborhood}>#{bedrooms}"
  # end


def self.bathroom_options
  @bathroom_options = ['limited bathrooms (i.e. 1 bath for 4 people)',
'normal number of bathrooms',
'extra bathrooms (i.e. a 3bd/2ba)']
end

def self.condition_options
  @condition_options = ['Worse condition than a typical SF apartment (moldy bathrooms, old/broken appliances, needs lots of repairs).','On-par with a typical SF apartment.','Much nicer than a typical apartment (new appliance, looks/feels recently renovated).']
end

end




class Calculator
  def get_estimate
    @estimate = @current_rent + @current_rent
  end
end