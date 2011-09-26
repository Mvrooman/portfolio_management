module ApplicationHelper
  def title
    base_title = "Portfolio Management"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end


  def logo
    image_tag "logo.png", :alt => "Sample App", :class => "round"
  end

  def totalValue
    portfolios = Portfolio.all
    @totalValue = 0;
    portfolios.each do |p|
      @totalValue += p.portfolioValue
    end
    (((@totalValue * 100.0).round / 100.0))
  end
end
