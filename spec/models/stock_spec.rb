# == Schema Information
#
# Table name: stocks
#
#  id         :integer         not null, primary key
#  symbol     :string(255)
#  name       :string(255)
#  price      :float
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Stock do
  before(:each) do
    @stock = Stock.create(:symbol => 'TTT', :price => '10.4', :name =>'Test T')
end

  it "should have a holdings attribute" do
    @stock.should respond_to(:holdings)
  end

  it "should have a symbol attribute" do
    @stock.should respond_to(:symbol)
  end

  it "should have a name attribute" do
    @stock.should respond_to(:name)
  end

  it "should have a price attribute" do
    @stock.should respond_to(:price)
  end
end
