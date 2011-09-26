xml.instruct!
xml.portfolios do
  @portfolios.each do |portfolio|
    xml.portfolio do
      xml.id portfolio.id
      xml.name portfolio.name
      portfolio.holdings.each do |holding|
        xml.holding do
          xml.id holding.id
          xml.amount holding.amount
          xml.stock do
            xml.id holding.stock.id
            xml.symbol holding.stock.symbol
            xml.name holding.stock.name
            xml.price holding.stock.price
          end
        end
      end
    end
  end
end
