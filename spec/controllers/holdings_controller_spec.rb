require 'spec_helper'

describe HoldingsController do

  describe "DELETE 'destroy'" do
    before(:each) do
      @portfolio = Portfolio.create(:name => 'Test Portfolio')
      @stock = Stock.create(:symbol => 'TTT', :price => '10.4', :name =>'Test T')
      @holding = Holding.create(:amount => 100, :stock => @stock, :portfolio => @portfolio)
      @params = {:id => @holding.id}
    end


    it "should destroy the holding" do
      lambda do
        delete :destroy, :id => @holding.id
      end.should change(Holding, :count).by(-1)
    end
  end

  describe "POST 'create'" do
    before(:each) do
      @portfolio = Portfolio.create(:name => 'Test Portfolio')
      @stock = Stock.create(:symbol => 'GE', :price => '10.4', :name =>'Test T')
    end
    it "should create the holding" do
      lambda do
        post :create, :symbol => 'GE',:portfolio_id => @portfolio.id , :holding =>{:amount =>1}
      end.should change(Holding, :count).by(1)
    end
  end
end


