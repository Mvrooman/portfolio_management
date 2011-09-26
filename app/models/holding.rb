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

class Holding < ActiveRecord::Base
  belongs_to :portfolio
  belongs_to :stock
  validates :amount, :presence => true
  validates :stock_id, :presence => true

  def value
     stockValue =   stock.price * amount
     (((stockValue * 100.0).round / 100.0))
  end
end
