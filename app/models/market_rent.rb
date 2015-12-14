class MarketRent < ActiveRecord::Base
require 'csv'

has_many :quotes
attr_reader :key, :neighborhood, :bedrooms, :market_rent, :file
attr_accessor :neighborhood_options, :bedrooms_options

def self.import(file)
  CSV.foreach(file.path, headers: true) do |row|
    MarketRent.create!(row.to_hash)
  end
end

def self.neighborhood_options
    # @neighborhood_options = ['SOMA / south beach','pacific heights']
    @neighborhood_options = MarketRent.uniq.pluck(:neighborhood)
    @neighborhood_options = @neighborhood_options.sort
end

def self.bedrooms_options
  @bedrooms_options = ['1br','2br','3br','4br','5br','6br']
end

end
