require 'yahoofinance'
class PagesController < ApplicationController
  def home
    @portfolios = Portfolio.all
    @new_portfolio = Portfolio.new
    @new_holding = Holding.new



    quote_type = YahooFinance::StandardQuote
    quote_symbol = ''
    Stock.all.each do |stock|
      quote_symbol+= stock.symbol+','
    end
    YahooFinance::get_quotes(quote_type, quote_symbol) do |qt|
      stock = Stock.find_by_symbol(qt.symbol)
      unless stock.nil?
        stock.price = qt.lastTrade
        stock.save
      end
    end
  end


  def contact

  end

  def portfolio
    @portfolios = Portfolio.all
    respond_to do |format|
      format.xml # index.xml.builder
    end
  end


end
