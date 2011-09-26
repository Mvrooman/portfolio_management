# == Schema Information
#
# Table name: holdings
#
#  id           :integer         not null, primary key
#  portfolio_id :integer
#  stock_id     :integer
#  amount       :integer
#  created_at   :datetime
#  updated_at   :datetime
#

require 'spec_helper'

describe Holding do
  before(:each) do
    @portfolio = Portfolio.create(:name => 'Test Portfolio')
    @stock = Stock.create(:symbol => 'TTT', :price => '10.4', :name =>'Test T')
    @holding = Holding.create(:amount => 100, :stock => @stock, :portfolio => @portfolio)
  end

  it "should have a stock attribute" do
    @holding.should respond_to(:stock)
  end

  it "should have a portfolio attribute" do
    @holding.should respond_to(:portfolio)
  end

  it "should have an amount attribute" do
    @holding.should respond_to(:amount)
  end
end
