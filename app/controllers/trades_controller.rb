class TradesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @trades = policy_scope(Trade).order(created_at: :desc)
    @trade = Trade.new
  end

  def create
    @trade = Trade.new(trade_params)
    authorize @trade
    if @trade.save
      redirect_to trades_path
    else
      render "index"
    end
  end

  def destroy
    @trade = Trade.find(params[:id])
    authorize @trade
    @trade.destroy
  end

  def trade_params
    params.require(:trade).permit[:name]
  end
end
