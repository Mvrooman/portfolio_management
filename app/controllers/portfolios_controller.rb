class PortfoliosController < ApplicationController
  def index
    @title = "All users"
    @portfolios = Portfolio.all
  end

  def create
    @portfolio = Portfolio.new(params[:portfolio])

    if @portfolio.save
      @new_holding = Holding.new
      flash[:success] = "Added portfolio #{@portfolio.name}"
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      flash[:error] = "Please enter a portfolio name"
      redirect_to root_path
    end

  end


  def destroy
    @portfolio = Portfolio.find(params[:id]).destroy
    flash[:success] = "Portfolio #{@portfolio.name} deleted."
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
end
