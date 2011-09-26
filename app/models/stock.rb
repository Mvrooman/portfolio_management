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

class Stock < ActiveRecord::Base
  has_many :stocks, :through => :holdings
  has_many :holdings
end
