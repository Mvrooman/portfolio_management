# == Schema Information
#
# Table name: portfolios
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Portfolio < ActiveRecord::Base
  has_many :holdings, :dependent => :destroy
  validates :name, :presence => true

  def portfolioValue
    value = 0
    holdings.each do |h|
      value += h.value
    end
    (((value * 100.0).round / 100.0))
  end
end
