class TradesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
    def index
    @trades = Trade.all
  end

  def create
    @trade = Trade.new(trade_params)
    if @trade.save
      redirect_to trades_path
    else
      render "index"
  end

  def destroy
    @trade = Trade.find(params[:id])
    @trade.destroy
  end

  def trade_params
    params.require(:trade).permit[:name]
  end
end
