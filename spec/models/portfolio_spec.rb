# == Schema Information
#
# Table name: portfolios
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Portfolio do
  before(:each) do
    @portfolio = Factory(:portfolio)
  end

  it "should have a name attribute" do
    @portfolio.should respond_to(:name)
  end

    it "should have a holdings attribute" do
    @portfolio.should respond_to(:holdings)
  end


end
