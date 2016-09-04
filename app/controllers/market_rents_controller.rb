class MarketRentsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: ENV["ADMIN_PASSWORD"], except: #[:new_quote]

  def import
   MarketRent.import(params[:file])
   render 'index', notice: "New data imported."
  end

  def index
    @market_rents = MarketRent.all
  end

  def new
    @market_rent = MarketRent.new
  end

  def create
   @market_rent = MarketRent.new(market_rent_params)
    render 'index'
  end

  # def edit
  #  MarketRents.import(params[:file])
  # end

  # def update
  #  MarketRents.import(params[:file])
  # end
  def show
    @market_rent = MarketRent.find(params[:id])
    render 'index'
  end


  def delete_all
    @market_rents = MarketRent.all
    @market_rents.delete_all
    # redirect_to market_rents_path
    render 'index'
  end

  private

  def market_rent_params
   params.permit(:key, :neighborhood, :market_rent, :file)
   # params.require(:market_rent).permit(:key, :neighborhood, :market_rent)
   end
end
