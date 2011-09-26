require 'yahoofinance'
class HoldingsController < ApplicationController
  def create
    @portfolio = Portfolio.find(params[:portfolio_id])
    @new_holding = Holding.new
    quote_type = YahooFinance::StandardQuote
    quote_symbol = "#{params[:symbol].upcase}"
    stock = Stock.find_by_symbol quote_symbol
    if stock.nil?
      YahooFinance::get_quotes(quote_type, quote_symbol) do |qt|
        if qt.lastTrade== 0.0
          flash.now[:error] = "Symbol #{quote_symbol} not found"
        else
          stock = Stock.create(:symbol => qt.symbol, :name => qt.name, :price => qt.lastTrade)
        end
      end
    end
    if !stock.nil?
      @holding = Holding.new(:portfolio => @portfolio, :stock => stock, :amount => params[:holding][:amount])
      if @holding.save
        flash[:success] = "Added holding #{@holding.stock.name} to #{@portfolio.name}"
        respond_to do |format|
          format.html { redirect_to root_path }
          format.js
        end
      else
        flash[:error] = "Please enter an amount for the holding"
        respond_to do |format|
          format.html { redirect_to root_path }
          format.js
        end
      end
    else
      flash[:error] = "Please enter a valid symbol and amount"
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end

  end


  def destroy
    @holding = Holding.find(params[:id]).destroy
    @portfolio = @holding.portfolio
    @new_holding = Holding.new
    flash[:success] = "#{@holding.stock.symbol} deleted from #{@holding.portfolio.name}."
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
end

