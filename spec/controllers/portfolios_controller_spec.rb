require 'spec_helper'

describe PortfoliosController do

  describe "DELETE 'destroy'" do
    before(:each) do
      @portfolio = Portfolio.create(:name => 'Test Portfolio')
      @stock = Stock.create(:symbol => 'TTT', :price => '10.4', :name =>'Test T')
      @holding = Holding.create(:amount => 100, :stock => @stock, :portfolio => @portfolio)
      @holding = Holding.create(:amount => 100, :stock => @stock, :portfolio => @portfolio)
    end


    it "should destroy the portfolio" do
      lambda do
        delete :destroy, :id => @portfolio.id
      end.should change(Portfolio, :count).by(-1)
    end

    it "should destroy holdings for the portfolio" do
      lambda do
        delete :destroy, :id => @portfolio.id
      end.should change(Holding, :count).by(-2)
    end
  end

  describe "POST 'create'" do
    it "should create the portfolio" do
      lambda do
        post :create, :portfolio => {:name =>'Test Portfolio'}
      end.should change(Portfolio, :count).by(1)
    end
  end
end
